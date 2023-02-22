class MatchModel {
  static List<Match> matches = [
    Match(
        datetime: " ",
        desc: "Match 1",
        location: "Shahu Stadium",
        matchID: "ab1",
        matchnum: 5,
        player1: "PTM",
        player2: "STM",
        ticketPrice: 50,
        tournamentName: "KSA"),
    Match(
        datetime: " ",
        desc: "Match 1",
        location: "Shahu Stadium",
        matchID: "ab1",
        matchnum: 5,
        player1: "RTM",
        player2: "STM",
        ticketPrice: 50,
        tournamentName: "KSA")
  ];
}

class Match {
  final String matchID;
  final String player1;
  final String player2;
  final String location;
  final int ticketPrice;
  final String desc;
  final String datetime;
  final int matchnum;
  final String tournamentName;

  Match(
      {this.matchID = "0",
      this.player1 = " ",
      this.player2 = " ",
      this.location = " ",
      this.ticketPrice = 0,
      this.desc = " ",
      this.datetime = " ",
      this.matchnum = 5,
      this.tournamentName = " "});

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      matchID: map["matchId"],
      player1: map["player1"],
      player2: map["player2"],
      location: map["location"],
      ticketPrice: map["ticketPrice"],
      desc: map["desc"],
      datetime: map["datetime"],
      matchnum: map["matchnum"],
      tournamentName: map["tournamentName"],
    );
  }

  toMap() => {
        "matchID": matchID,
        "player1": player1,
        "player2": player2,
        "location": location,
        "ticketPrice": ticketPrice,
        "desc": desc,
        "datetime": datetime,
        "matchnum": matchnum,
        "tournamentName": tournamentName,
      };
}
