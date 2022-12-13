import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tukir/controller/auth_controller.dart';

class Settings extends StatefulWidget {
  final String? uid;
  const Settings(this.uid, {super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final user = FirebaseAuth.instance.currentUser;
  // String selectedProdi = "Informatika";
  // String selectedAngkatan = "2018";

  // List<DropdownMenuItem<String>> get dropdownPodi {
  //   List<DropdownMenuItem<String>> prodiItems = [
  //     const DropdownMenuItem(
  //       value: "Informatika",
  //       child: Text(
  //         "Informatika",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ),
  //     const DropdownMenuItem(
  //         value: "Sipil",
  //         child: Text(
  //           "Sipil",
  //           style: TextStyle(color: Colors.white),
  //         )),
  //     const DropdownMenuItem(
  //         value: "Mesin",
  //         child: Text(
  //           "Mesin",
  //           style: TextStyle(color: Colors.white),
  //         )),
  //     const DropdownMenuItem(
  //         value: "Arsitektur",
  //         child: Text(
  //           "Arsitektur",
  //           style: TextStyle(color: Colors.white),
  //         )),
  //   ];
  //   return prodiItems;
  // }

  // List<DropdownMenuItem<String>> get dropdownAngkatan {
  //   List<DropdownMenuItem<String>> angkatanItems = [
  //     const DropdownMenuItem(
  //       value: "2018",
  //       child: Text(
  //         "2018",
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ),
  //     const DropdownMenuItem(
  //         value: "2019",
  //         child: Text(
  //           "2019",
  //           style: TextStyle(color: Colors.white),
  //         )),
  //     const DropdownMenuItem(
  //         value: "2020",
  //         child: Text(
  //           "2020",
  //           style: TextStyle(color: Colors.white),
  //         )),
  //     const DropdownMenuItem(
  //         value: "2021",
  //         child: Text(
  //           "2021",
  //           style: TextStyle(color: Colors.white),
  //         )),
  //   ];
  //   return angkatanItems;
  // }

  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome\n${user!.displayName != null ? (user!.displayName).toString() : (user!.email).toString()}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          CircleAvatar(
            child: user!.photoURL == null
                ? const Icon(Icons.person)
                : Image.network((user?.photoURL).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: const InputDecoration(labelText: "Nama "),
              readOnly: true,
              controller:
                  TextEditingController(text: user!.displayName ?? "Empty"),
            ),
          ),
          // _image != null
          //     ? CircleAvatar(
          //         radius: 50, backgroundImage: Image.file(_image!).image)
          //     : CircleAvatar(
          //         radius: 50,
          //         backgroundColor: const Color.fromARGB(255, 207, 207, 207),
          //         child: IconButton(
          //           iconSize: 45,
          //           onPressed: () async {
          //             await getImage();
          //             // ignore: use_build_context_synchronously
          //             _toastImage(context);
          //           },
          //           icon: const Icon(Icons.add_a_photo),
          //         ),
          //       ),

          const SizedBox(
            height: 8,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(15),
          //   child: DropdownButton(
          //     // focusColor: Colors.white,
          //     dropdownColor: Colors.blueAccent,
          //     value: selectedProdi,
          //     items: dropdownPodi,
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         selectedProdi = newValue!;
          //       });
          //     },
          //   ),
          // ),
          // const SizedBox(
          //   height: 8,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(15),
          //   child: DropdownButton(
          //     dropdownColor: Colors.blueAccent,
          //     value: selectedAngkatan,
          //     items: dropdownAngkatan,
          //     onChanged: (String? newValue) {
          //       setState(() {
          //         selectedAngkatan = newValue!;
          //       });
          //     },
          //   ),
          // ),
          // const SizedBox(
          //   height: 8,
          // ),
          ElevatedButton.icon(
              onPressed: () {
                authC.logout(context, mounted);
              },
              icon: const Icon(Icons.logout_rounded),
              label: const Text('Logout'))
        ],
      ),
    );
    // return FloatingActionButton(
    //   onPressed: () => authC.logout(context, mounted),
    //   child: Icon(Icons.logout),
    // );
  }
}
