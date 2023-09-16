import 'package:catalog_app/pages/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
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
          ElevatedButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
