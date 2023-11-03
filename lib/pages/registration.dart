import 'package:catalog_app/provider/all_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    moveToHome(email, password) async {
      await context.read<ButtonStateProvider>().changeButton(true);
      await Future.delayed(Duration(milliseconds: 400));
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamedAndRemoveUntil(
          context, '/accountCreated', (route) => false);
    }

    final _formKey = GlobalKey<FormState>();
    final TextEditingController email = TextEditingController();

    final TextEditingController password = TextEditingController();

    final TextEditingController username = TextEditingController();

    return Consumer(
      builder: (context, value, child) => GestureDetector(
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
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.41,
                    child: Image.asset("assets/images/register_image.png",
                        fit: BoxFit.cover),
                  ),
                  const Text(
                    'Welcome',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username can not be empty';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter username here',
                              labelText: 'Username'),
                        ),
                        TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: const [AutofillHints.email],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email can no be empty';
                              } else if (!value.contains('@') ||
                                  !value.contains('.com')) {
                                return 'Enter correct email adress please';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: 'Enter email here',
                                labelText: 'Email')),
                        TextFormField(
                            controller: password,
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
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        moveToHome(email.text, password.text);
                      } else
                        return null;
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
                              'Register',
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
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Back to login page',
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
      ),
    );
  }
}
