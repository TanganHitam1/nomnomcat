import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  var faker = Faker();
  int n = Random().nextInt(40) + 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 50,
            maxHeight: 100,
          ),
          child: SizedBox(
            child: Container(
              color: Colors.black87,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: n,
                itemBuilder: (BuildContext context, int index) {
                  return Circle("https://picsum.photos/id/$index/300");
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Container(
              color: Colors.black87,
              child: ListView.builder(
                itemCount: n,
                itemBuilder: (BuildContext context, int index) {
                  return Content("https://picsum.photos/id/$index/300",
                      faker.person.name());
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Content extends StatelessWidget {
  final String imageUrl;
  final String name;
  const Content(this.imageUrl, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.transparent,
        child: Column(
          children: [
            ListTile(
              leading: Container(
                margin: const EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Color(Random().nextInt(0xffffffff)),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
              title: Text(
                name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(Random().nextInt(0xffffffff)),
                      Color(Random().nextInt(0xffffffff)),
                      Color(Random().nextInt(0xffffffff)),
                      Color(Random().nextInt(0xffffffff)),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final String imageUrl;

  const Circle(this.imageUrl, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 1, 4, 1),
      child: CircleAvatar(
        radius: 33,
        backgroundColor: Color(Random().nextInt(0xffffffff)),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
