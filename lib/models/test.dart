import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';

void inputData(String? uid) async {
  Faker faker = Faker();
  String email = faker.internet.email();
  String name = faker.internet.userName();
  String password = faker.randomGenerator.string(10);
  final data = Data(
    email: email,
    name: name,
    password: password,
    monday: [
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
    ],
    tuesday: [
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
    ],
    wednesday: [
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
    ],
    thursday: [
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
    ],
    friday: [
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
    ],
    saturday: [
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
    ],
    sunday: [
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
    ],
  );
  final docRef =
      FirebaseFirestore.instance.collection("nomnomcat").doc(uid).withConverter(
            fromFirestore: Data.fromFirestore,
            toFirestore: (Data data, options) => data.toFirestore(),
          );
  await docRef.set(data);
}

class Data {
  final String? name;
  final String? email;
  var password;
  final List<int>? monday;
  final List<int>? tuesday;
  final List<int>? wednesday;
  final List<int>? thursday;
  final List<int>? friday;
  final List<int>? saturday;
  final List<int>? sunday;

  Data({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.name,
    this.email,
    this.password,
  });

  factory Data.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Data(
      name: data?['name'],
      email: data?['email'],
      password: data?['password'],
      monday: data?['Monday'],
      tuesday: data?['Tuesday'],
      wednesday: data?['Wednesday'],
      thursday: data?['Thursday'],
      friday: data?['Friday'],
      saturday: data?['Saturday'],
      sunday: data?['Sunday'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (password != null) "password": password,
      if (monday != null) "Monday": monday,
      if (tuesday != null) "Tuesday": tuesday,
      if (wednesday != null) "Wednesday": wednesday,
      if (thursday != null) "Thursday": thursday,
      if (friday != null) "Friday": friday,
      if (saturday != null) "Saturday": saturday,
      if (sunday != null) "Sunday": sunday,
    };
  }
}
