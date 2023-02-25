import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //For Ticket Buying
  int ticketPurchased = 1;

  @override
  Widget build(BuildContext context) {
    //Getting Arguments from previous page
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    int matchID = arguments['matchid'];
    int matchnum = arguments['matchnum'];
    String player1 = arguments['player1'];
    String player2 = arguments['player2'];
    String datetime = arguments['datetime'];
    String tournamentName = arguments['tournamentName'];
    String location = arguments['location'];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Image(
                    image: const NetworkImage(
                        "https://th.bing.com/th/id/R.a2151984affcd64281acaffa06329631?rik=M49zvEKS9ZN4rg&riu=http%3a%2f%2fe1.365dm.com%2f17%2f09%2f16-9%2f20%2fskysports-premier-league-football-nike-ordem-pitch-stock-generic-general-view_4102302.jpg%3f20171006115508&ehk=ulKY2HNPJIqx0%2bRAHZinkVqGGKOEXJZ2p4q86mK3i7U%3d&risl=&pid=ImgRaw&r=0"),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0x89000000),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.zero,
                      border:
                          Border.all(color: const Color(0x4d9e9e9e), width: 1),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(0),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Color(0xff000000),
                              size: 24,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Utils().toastMsg("Feature Coming Soon...");
                          },
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(0),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xff8bc34a),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Icon(
                              Icons.add_alert,
                              color: Color(0xffffffff),
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16.0),
                    border:
                        Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "$player1 Vs. $player2",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 22,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "This is match number $matchnum of Tournament $tournamentName to be played between $player1 and $player2. \n\nVenue: $location \nTime: $datetime",
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff7e7e7e),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f3f3),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.zero,
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Book Tickets Now!",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (ticketPurchased == 1) {
                                        Utils().toastMsg(
                                            "You must purchase atleast One Ticket");
                                      } else {
                                        ticketPurchased -= 1;
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(0),
                                    padding: const EdgeInsets.all(0),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0x00ffffff),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                          color: const Color(0xffa6a2a2),
                                          width: 1),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Color(0xff212435),
                                      size: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 16),
                                  child: Text(
                                    ticketPurchased.toString(),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (ticketPurchased == 4) {
                                        Utils().toastMsg(
                                            "You can purchase maximum 4 tickets");
                                      } else {
                                        ticketPurchased += 1;
                                      }
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(0),
                                    padding: const EdgeInsets.all(0),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0x00ffffff),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(4.0),
                                      border: Border.all(
                                          color: const Color(0xffa6a2a2),
                                          width: 1),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Color(0xff212435),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    onPressed: () {
                      Utils().toastMsg("Booking not supported yet!");
                    },
                    color: const Color(0xff8bc34a),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: const EdgeInsets.all(16),
                    textColor: const Color(0xffffffff),
                    height: 45,
                    minWidth: MediaQuery.of(context).size.width,
                    child: const Text(
                      "BOOK NOW",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
