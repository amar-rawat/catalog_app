import 'package:catalog_app/provider/all_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  late String name;
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context, email, password) async {
    await context.read<ButtonStateProvider>().changeButton(true);
    await Future.delayed(const Duration(milliseconds: 400));
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset("assets/images/welcome_image.png",
                    fit: BoxFit.cover),
                const SizedBox(height: 30),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: const [AutofillHints.email],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email can not be empty';
                          } else if (!value.contains('@') ||
                              !value.contains('.com')) {
                            return 'Enter correct email adress';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Enter email here', labelText: 'Email'),
                      ),
                      TextFormField(
                        controller: _password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password can not be empty';
                          } else if (value.length < 6) {
                            return 'Password length should be atleast 6';
                          }
                          return null;
                        },
                        obscureText: true,
                        enableSuggestions: false,
                        decoration: const InputDecoration(
                          hintText: 'Enter password here',
                          labelText: 'Password',
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      moveToHome(context, _email.text, _password.text);
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: context.watch<ButtonStateProvider>().buttonState
                        ? 40
                        : 150,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(40)),
                    child: context.watch<ButtonStateProvider>().buttonState
                        ? const Icon(Icons.done, color: Colors.white)
                        : const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.cyan,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
