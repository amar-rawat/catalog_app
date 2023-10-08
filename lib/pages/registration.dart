import 'package:catalog_app/pages/home.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Register> {
  late String name;
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Username can not be empty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Enter username here',
                            labelText: 'Username')),
                    TextFormField(
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
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: changeButton ? 40 : 150,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(40)),
                  child: changeButton
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
                      color: Colors.cyan, decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
