import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kickgo/models/matches.dart';
import 'package:kickgo/widgets/drawer.dart';
import 'dart:convert';
import '../widgets/match_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  int _selectedIndex = 0;

  loadData() async {
    final matchjson = await rootBundle.loadString("assets/files/matches.json");
    final decodedData = jsonDecode(matchjson);
    var matchesData = decodedData["matches"];
    MatchModel.matches = List.from(matchesData)
        .map<Match>((match) => Match.fromMap(match))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/appBar_img.png"),
                fit: BoxFit.fitWidth),
          ),
        ),
        toolbarHeight: 100,
        backgroundColor: Colors.orangeAccent,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          "Matches",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            child: Icon(Icons.account_circle, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: (_selectedIndex == 0)
          ? ListView.builder(
              itemCount: MatchModel.matches.length,
              itemBuilder: (context, index) {
                return MatchWidget(
                  match: MatchModel.matches[index],
                );
              },
            )
          : ListView.builder(
              itemCount: MatchModel.matches.length,
              itemBuilder: (context, index) {
                return MatchWidget(
                  match: MatchModel.matches[index],
                );
              },
            ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'My Tickets',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) => setState(() => _selectedIndex = index),
        elevation: 1,
        backgroundColor: Colors.orange[300],
      ),
    );
  }
}
