import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tukir/page/chart.dart';
import '../models/CatsData.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  final String? uid;
  const Home(this.uid, {super.key});

  @override
  State<Home> createState() => _HomeState(uid);
}

class _HomeState extends State<Home> {
  String? uid;
  _HomeState(this.uid);
  List<CatsData> dataCat = [];

  static String nowDayDate = DateFormat('EEEE').format(DateTime.now());
  static String dayDate = nowDayDate;

  static List<String> listOfDay = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  static int dayIndex = listOfDay.indexOf(dayDate);

  @override
  void initState() {
    super.initState();
    dayDate = nowDayDate;
  }

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot<Map<String, dynamic>>> day =
        FirebaseFirestore.instance.collection('nomnomcat').doc(uid).snapshots();
    return ListView(children: [
      Container(
        padding: const EdgeInsets.only(top: 50),
        margin: const EdgeInsets.only(left: 40, right: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => setState(() {
                      dayIndex -= 1;
                      if (dayIndex < 0) {
                        dayIndex = 6;
                      }
                      dayDate = listOfDay[dayIndex];
                    }),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            Text(
              dayDate,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            IconButton(
                onPressed: () => setState(() {
                      dayIndex += 1;
                      if (dayIndex > 6) {
                        dayIndex = 0;
                      }
                      dayDate = listOfDay[dayIndex];
                    }),
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
          ],
        ),
      ),
      StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: day,
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SfChart(dataCat);
          }
          final data = snapshot.data?.data();
          dataCat.clear();
          List<int> comeCount = List<int>.from(data?[dayDate]);
          for (int x = 0; x < comeCount.length; x++) {
            try {
              if (x < 10) {
                dataCat.add(
                    CatsData('0$x.00', int.parse((comeCount[x]).toString())));
              } else {
                dataCat.add(
                    CatsData('$x.00', int.parse((comeCount[x]).toString())));
              }
            } catch (e) {
              continue;
            }
          }
          return SfChart(dataCat);
        },
      ),
    ]);
  }
}
