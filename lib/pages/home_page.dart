import 'package:flutter/material.dart';
import 'package:kickgo/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff295e2b),
        ),
        title: Text(
          "KickGo",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        elevation: 5,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child:
                Icon(Icons.account_circle, color: Color(0xff295e2b), size: 24),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Container(
            child: Text("Welcome"),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
