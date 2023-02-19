import 'package:flutter/material.dart';
import 'package:kickgo/pages/register_page.dart';
import 'package:kickgo/utils/routes.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KickGo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyRoutes.loginRoute,
      home: LoginPage(),
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.registerRoute: (context) => RegisterPage(),
      },
    );
  }
}
