class MatchModel {
  static final matches = [
    Match(
        datetime: " ",
        desc: "Match 1",
        location: "Shahu Stadium",
        matchID: "ab1",
        matchnum: 5,
        player1: "PTM",
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
}
