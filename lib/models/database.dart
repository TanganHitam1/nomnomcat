import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDate extends StatelessWidget {
  final String documentId;

  GetDate(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference Date =
        FirebaseFirestore.instance.collection('/nomnomcat/Date');

    return FutureBuilder<DocumentSnapshot>(
      //Fetching data from the documentId specified of the Date
      future: Date.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //Error Handling conditions
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        //Data is output to the user
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Monday: ${data['Monday']}");
        }

        return const Text("loading");
      },
    );
  }
}
