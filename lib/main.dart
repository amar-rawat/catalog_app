import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'themes/mytheme.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/login.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalog App',
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/login",
      routes: {
        "/login": (context) => const LoginPage(),
        "/home": (context) => const HomePage(),
        "/cart": (context) => const CartPage(),
      },
    );
  }
}
