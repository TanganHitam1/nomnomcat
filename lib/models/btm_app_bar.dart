import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tukir/models/login_modals.dart';
import 'package:tukir/page/calculate.dart';
import 'package:tukir/page/home.dart';
import 'package:tukir/page/notification.dart';
import 'package:tukir/page/settings.dart';

class BtmAppBar extends StatefulWidget {
  static const routeName = '/btm';

  const BtmAppBar({super.key});

  @override
  _BtmAppBarState createState() => _BtmAppBarState();
}

class _BtmAppBarState extends State<BtmAppBar> {
  int _selectedIndex = 1;
  final listIcon = const [
    // Icon(Icons.person),
    Icon(Icons.notifications),
    Icon(Icons.home),
    Icon(Icons.settings),
  ];

  void setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final LoginModals loginModals =
        ModalRoute.of(context)!.settings.arguments as LoginModals;
    final screen = [
      // const MyListView(),
      const Notif(),
      Home(loginModals.uid),
      Settings(loginModals.uid),
      const Calculate()
    ];

    return Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromARGB(255, 26, 68, 122),
        appBar: _selectedIndex == 1
            ? null
            : AppBar(
                backgroundColor: Colors.blue,
                leading: Container(),
                title: _selectedIndex == 0
                    ? const Text('Notification')
                    : _selectedIndex == 2
                        ? const Text('Profile')
                        : const Text('Error'),
                centerTitle: mounted,
              ),
        body: Center(
          child: screen[_selectedIndex],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blue,
          // color: const Color.fromARGB(255, 52, 182, 255),
          buttonBackgroundColor: Colors.blue,
          // buttonBackgroundColor: const Color.fromARGB(255, 52, 182, 255),
          backgroundColor: Colors.transparent,
          index: _selectedIndex,
          items: listIcon,
          onTap: (index) {
            if (index != _selectedIndex) {
              setIndex(index);
            }
          },
          animationCurve: Curves.decelerate,
        ));
  }
}
