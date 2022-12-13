import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tukir/models/login_modals.dart';

import '../controller/auth_controller.dart';
import '../models/Users.dart';
import '../models/btm_app_bar.dart';
import './register.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const routeName = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool _passwordVisible;
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controller =
      List.generate(2, (i) => TextEditingController());
  final Users usr = Users('', '');
  final authC = Get.find<AuthController>();

  void _setText() {
    setState(() {
      usr.email = _controller[0].text;
      usr.pass = _controller[1].text;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    // _controller[0].text = 'mario.chamdjoko@mhs.itenas.ac.id';
    // _controller[1].text = 'nomnomcat';
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 68, 122),
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: mounted,
      ),
      body: Center(
        child: SizedBox(
          height: 370,
          child: Card(
            color: const Color.fromARGB(255, 109, 189, 255),
            elevation: 5,
            margin: const EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            autofocus: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: 'Email', hintText: 'Input Email'),
                            controller: _controller[0],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be empty!!';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (value) async {
                              if (_formKey.currentState!.validate()) {
                                _setText();
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: usr.email, password: usr.pass);
                                  _controller[0].clear();
                                  _controller[1].clear();
                                  print(FirebaseAuth.instance.currentUser);
                                  final user =
                                      FirebaseAuth.instance.currentUser;
                                  print(user?.uid);

                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(
                                      context, BtmAppBar.routeName,
                                      arguments: LoginModals(
                                          (user?.uid).toString(),
                                          (user?.email).toString()));
                                } on FirebaseAuthException catch (e) {
                                  if (!mounted) return;
                                  switch (e.code) {
                                    case 'invalid-email':
                                      _showToast(context, 'Invalid Email');
                                      break;
                                    case 'wrong-password':
                                      _showToast(context, 'invalid password');
                                      break;
                                    case 'user-not-found':
                                      _showToast(context, 'user not found');
                                      break;
                                    case 'user-disabled':
                                      _showToast(context, 'user disabled');
                                      break;
                                    default:
                                      _showToast(
                                          context, 'error code : ${e.code}');
                                      break;
                                  }
                                }
                              }
                              // if (FirebaseAuth.instance.currentUser == null) {
                              //   if (!mounted) return;
                              //   _showToast(context);
                              // }
                            },
                            autofocus: false,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: 'Input Password',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color:
                                        const Color.fromARGB(255, 26, 68, 122),
                                  ),
                                )),
                            obscureText: !_passwordVisible,
                            controller: _controller[1],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be empty!!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, Register.routeName);
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 15, 69, 139),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _setText();
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: usr.email,
                                              password: usr.pass);
                                      _controller[0].clear();
                                      _controller[1].clear();
                                      print(FirebaseAuth.instance.currentUser);
                                      final user =
                                          FirebaseAuth.instance.currentUser;
                                      print(user?.uid);

                                      // ignore: use_build_context_synchronously
                                      Navigator.pushNamed(
                                        context,
                                        BtmAppBar.routeName,
                                      );
                                    } on FirebaseAuthException catch (e) {
                                      if (!mounted) return;
                                      switch (e.code) {
                                        case 'invalid-email':
                                          _showToast(context, 'Invalid Email');
                                          break;
                                        case 'wrong-password':
                                          _showToast(
                                              context, 'invalid password');
                                          break;
                                        case 'user-not-found':
                                          _showToast(context, 'user not found');
                                          break;
                                        case 'user-disabled':
                                          _showToast(context, 'user disabled');
                                          break;
                                        default:
                                          _showToast(context,
                                              'error code : ${e.code}');
                                          break;
                                      }
                                    }
                                  }
                                  // if (FirebaseAuth.instance.currentUser == null) {
                                  //   if (!mounted) return;
                                  //   _showToast(context);
                                  // }
                                },
                                child: const Text('Login')))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// mario.chamdjoko@mhs.itenas.ac.id
// nomnomcat

void _showToast(BuildContext context, String txt) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(txt),
      action:
          SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
