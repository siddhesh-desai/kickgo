import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:kickgo/utils/routes.dart';
import 'package:kickgo/widgets/drawer.dart';
import '../widgets/match_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //For Switching between Matches and Tickets
  int _selectedIndex = 0;

  //Firebase
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('matches');

  //Searching
  final searchFilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        scrolledUnderElevation: 3,
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
        title: (_selectedIndex == 0)
            ? const Text(
                "Matches",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              )
            : const Text(
                "My Tickets",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
        elevation: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.profileRoute);
              },
              child: const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: (_selectedIndex == 0)
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
                  child: TextFormField(
                    controller: searchFilter,
                    decoration: const InputDecoration(
                      hintText: "Search Team",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: FirebaseAnimatedList(
                    query: ref,
                    defaultChild: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    itemBuilder: (context, snapshot, animation, index) {
                      final player = snapshot.child('player1').value.toString();
                      final playerr =
                          snapshot.child('player2').value.toString();

                      if (searchFilter.text.isEmpty) {
                        return MatchWidget(
                          player1: snapshot.child('player1').value.toString(),
                          player2: snapshot.child('player2').value.toString(),
                          datetime: snapshot.child('datetime').value.toString(),
                          location: snapshot.child('location').value.toString(),
                          matchnum: int.parse(
                              snapshot.child('matchnum').value.toString()),
                          matchid: int.parse(
                              snapshot.child('matchID').value.toString()),
                          nowTicketCount: int.parse(snapshot
                              .child('nowTicketCount')
                              .value
                              .toString()),
                          ticketPrice: int.parse(
                              snapshot.child('ticketPrice').value.toString()),
                          totalTicketCount: int.parse(snapshot
                              .child('totalTicketCount')
                              .value
                              .toString()),
                          tournamentName:
                              snapshot.child('tournamentName').value.toString(),
                        );
                      } else if (player
                              .toLowerCase()
                              .contains(searchFilter.text.toLowerCase()) ||
                          playerr
                              .toLowerCase()
                              .contains(searchFilter.text.toLowerCase())) {
                        return MatchWidget(
                          player1: snapshot.child('player1').value.toString(),
                          player2: snapshot.child('player2').value.toString(),
                          datetime: snapshot.child('datetime').value.toString(),
                          location: snapshot.child('location').value.toString(),
                          matchid: int.parse(
                              snapshot.child('matchID').value.toString()),
                          matchnum: int.parse(
                              snapshot.child('matchnum').value.toString()),
                          nowTicketCount: int.parse(snapshot
                              .child('nowTicketCount')
                              .value
                              .toString()),
                          ticketPrice: int.parse(
                              snapshot.child('ticketPrice').value.toString()),
                          totalTicketCount: int.parse(snapshot
                              .child('totalTicketCount')
                              .value
                              .toString()),
                          tournamentName:
                              snapshot.child('tournamentName').value.toString(),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            )
          : Column(children: const []),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        items: const [
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
