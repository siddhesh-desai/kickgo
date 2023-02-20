import 'package:flutter/material.dart';
import 'package:kickgo/models/matches.dart';

class MatchWidget extends StatelessWidget {
  final Match match;

  const MatchWidget({required this.match});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("Clicked!");
        },
        title: Text("${match.player1} Vs. ${match.player2}"),
        subtitle: Text(match.location),
        trailing: Text("Rs. ${match.ticketPrice.toString()}"),
      ),
    );
  }
}
