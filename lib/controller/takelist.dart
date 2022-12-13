import 'package:cloud_firestore/cloud_firestore.dart';

Future<List> getCatComeCount(String name, List daylist, String dayDate) async {
  FirebaseFirestore.instance
      .collection('nomnomcat')
      .where("name", isEqualTo: name)
      .get()
      .then((data) => data.docs.forEach((doc) {
            daylist.add(doc[dayDate]);
          }));
  return daylist;
}
