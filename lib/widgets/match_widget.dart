import 'package:flutter/material.dart';
import 'package:kickgo/models/matches.dart';

class MatchWidget extends StatelessWidget {
  final Match match;

  const MatchWidget({required this.match});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 14, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
          image: DecorationImage(
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
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      match.player1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
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
                    Text(
                      match.player2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Match No: ${match.matchnum}, ${match.tournamentName} Tournament 2023",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${match.datetime} at ${match.location}",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        side: BorderSide(
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
                          "Rs. 20",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // TextButton(
                    //   style: TextButton.styleFrom(
                    //     side: BorderSide(
                    //       width: 1,
                    //       color: Colors.orangeAccent,
                    //     ),
                    //     backgroundColor: Colors.black87,
                    //     alignment: Alignment.centerLeft,
                    //   ),
                    //   onPressed: () {},
                    //   child: Padding(
                    //     padding: EdgeInsets.fromLTRB(8, 1, 8, 1),
                    //     child: Text(
                    //       "Remind Later",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 15,
                    //         color: Colors.orangeAccent,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: BorderSide(
                          width: 1,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                        child: Text(
                          "Book Tickets",
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
            // subtitle: Text(match.location),
            // trailing: Text("Rs. ${match.ticketPrice.toString()}"),
          ),
        ),
      ),
    );
  }
}
