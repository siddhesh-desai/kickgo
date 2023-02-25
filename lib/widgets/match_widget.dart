import 'package:flutter/material.dart';
import 'package:kickgo/main.dart';
import 'package:kickgo/utils/routes.dart';

class MatchWidget extends StatelessWidget {
  //Variables to fetch
  final String player1;
  final String player2;
  final int matchnum;
  final String tournamentName;
  final String datetime;
  final String location;
  final int ticketPrice;
  final int totalTicketCount;
  final int nowTicketCount;
  final int matchid;

  //Constructor
  const MatchWidget(
      {super.key,
      required this.player1,
      required this.player2,
      required this.matchnum,
      required this.datetime,
      required this.tournamentName,
      required this.totalTicketCount,
      required this.nowTicketCount,
      required this.ticketPrice,
      required this.matchid,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 0),
            ),
          ],
          image: const DecorationImage(
              image: AssetImage('assets/images/card_bg.png'),
              opacity: 0.95,
              fit: BoxFit.fitWidth),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        player1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Text(
                      "Vs.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        player2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Text(
                        "Match No: $matchnum, $tournamentName",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        "$datetime at $location",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        side: const BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.transparent,
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                          "Rs. $ticketPrice",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: const BorderSide(
                          width: 1,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      onPressed: () {
                        if (nowTicketCount < totalTicketCount) {
                          MyApp.currMatchID = matchid;
                          Navigator.pushNamed(
                            context,
                            MyRoutes.detailsRoute,
                            arguments: {
                              'matchid': matchid,
                              'player1': player1,
                              'player2': player2,
                              'matchnum': matchnum,
                              'datetime': datetime,
                              'tournamentName': tournamentName,
                              'totalTicketCount': totalTicketCount,
                              'nowTicketCount': nowTicketCount,
                              'ticketPrice': ticketPrice,
                              'location': location,
                            },
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                        child: nowTicketCount < totalTicketCount
                            ? const Text(
                                "Book Tickets",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              )
                            : const Text(
                                "Stadium Full",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
