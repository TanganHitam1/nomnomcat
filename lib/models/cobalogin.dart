import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tukir/models/test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmailSignInPage(),
    );
  }
}

class EmailSignInPage extends StatelessWidget {
  const EmailSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emCon = TextEditingController();
    TextEditingController passCon = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SIGN IN WITH EMAIL/PASSWORD",
                style: GoogleFonts.lato(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<User?>(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('SIGNED IN ${snapshot.data?.email}');
                  } else {
                    return const Text("You haven't signed in yet");
                  }
                }),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 15, 30, 10),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: TextField(
                controller: emCon,
                cursorColor: Colors.orange,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Email'),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 15, 30, 10),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: TextField(
                obscureText: true,
                controller: passCon,
                cursorColor: Colors.orange,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Password'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange.shade900)),
                    onPressed: () async {
                      if (FirebaseAuth.instance.currentUser == null) {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emCon.text, password: passCon.text);
                        inputData(FirebaseAuth.instance.currentUser?.uid);
                      } else {
                        await FirebaseAuth.instance.signOut();
                      }
                    },
                    child: StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.userChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return const Text('Sign Out');
                          } else {
                            return const Text('Sign Up');
                          }
                        }),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange.shade900)),
                    onPressed: () async {
                      if (FirebaseAuth.instance.currentUser == null) {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emCon.text, password: passCon.text);
                      } else {
                        await FirebaseAuth.instance.signOut();
                      }
                    },
                    child: StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.userChanges(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return const Text('Sign Out');
                          } else {
                            return const Text('Sign In');
                          }
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
