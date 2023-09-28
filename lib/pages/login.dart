import 'package:catalog_app/pages/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/welcome_image.png", fit: BoxFit.cover),
            const SizedBox(height: 30),
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter username here',
                          labelText: 'Username')),
                  TextFormField(
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
              onTap: () async {
                setState(() {
                  changeButton = true;
                });
                await Future.delayed(const Duration(seconds: 1));
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
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
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
