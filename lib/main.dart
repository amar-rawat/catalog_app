import 'package:catalog_app/pages/account_created.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:catalog_app/pages/registration.dart';
import 'package:catalog_app/provider/all_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'themes/mytheme.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA-1FklYwvKKrwoU4awxrJJ0q_DRAmZcOY",
      appId: "1:482936708520:android:2b19566ee97389646cd19d",
      messagingSenderId: "482936708520",
      projectId: "catalog-a7a75",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ButtonStateProvider()),
          ChangeNotifierProvider(create: (context) => CartListProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Catalog App',
          themeMode: ThemeMode.light,
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
          initialRoute: "/home",
          routes: {
            "/login": (context) => const LoginPage(),
            "/home": (context) => const HomePage(),
            "/cart": (context) => const CartPage(),
            "/register": (context) => Register(),
            "/accountCreated": (context) => const AccountCreated(),
          },
        ));
  }
}
