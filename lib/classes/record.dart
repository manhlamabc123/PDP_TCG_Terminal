class Record {
  String format;
  String you;
  String opponent;
  String yourDeck;
  String opponentDeck;
  String yourScore;
  String opponentScore;

  Record(this.format, this.you, this.opponent, this.yourDeck, this.yourScore,
      this.opponentDeck, this.opponentScore);

  Map<String, dynamic> toJson() => {
        'format': format,
        'you': you,
        'opponent': opponent,
        'yourDeck': yourDeck,
        'opponentDeck': opponentDeck,
        'yourScore': yourScore,
        'opponentScore': opponentScore,
      };
}
