import 'package:flutter/material.dart';
import 'package:kickgo/pages/about_page.dart';
import 'package:kickgo/pages/details_page.dart';
import 'package:kickgo/pages/home_page.dart';
import 'package:kickgo/pages/profile_page.dart';
import 'package:kickgo/pages/payment.dart';
import 'package:kickgo/pages/register_page.dart';
import 'package:kickgo/pages/ticket_page.dart';
import 'package:kickgo/utils/routes.dart';
import 'package:kickgo/widgets/themes.dart';
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
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.aboutRoute,
      home: const HomePage(),
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.registerRoute: (context) => RegisterPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.detailsRoute: (context) => DetailsPage(),
        MyRoutes.ticketRoute: (context) => TicketPage(),
        MyRoutes.profileRoute: (context) => ProfilePage(),
        MyRoutes.aboutRoute: (context) => AboutPage(),
        MyRoutes.paymentRoute: (context) => PaymentPage(),
      },
    );
  }
}
