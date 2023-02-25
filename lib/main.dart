import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kickgo/pages/about_page.dart';
import 'package:kickgo/pages/details_page.dart';
import 'package:kickgo/pages/home_page.dart';
import 'package:kickgo/pages/profile_page.dart';
import 'package:kickgo/pages/register_page.dart';
import 'package:kickgo/pages/ticket_page.dart';
import 'package:kickgo/utils/routes.dart';
import 'package:kickgo/widgets/themes.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static String userId = "";

  static String name = "";

  static String email = "";
  static int currMatchID = 0;

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KickGo',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.registerRoute: (context) => RegisterPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.detailsRoute: (context) => DetailsPage(),
        MyRoutes.ticketRoute: (context) => TicketPage(),
        MyRoutes.profileRoute: (context) => ProfilePage(),
        MyRoutes.aboutRoute: (context) => AboutPage(),
      },
    );
  }
}
