import 'package:flutter/material.dart';
import 'package:tukir/page/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 68, 122),
      appBar: AppBar(
        title: const Text('Registrasi'),
        centerTitle: mounted,
      ),
      body: Center(
        child: SizedBox(
          height: 500,
          child: Card(
            color: const Color.fromARGB(255, 109, 189, 255),
            elevation: 5,
            margin: const EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Username', hintText: 'Input Username'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Password', hintText: 'Input Password'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Input Confirm Password'),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Login.routeName);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Color.fromARGB(255, 15, 69, 139),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      onPressed: () => _showToast(context),
                      child: const Text('Register')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Berhasil Registrasi'),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
