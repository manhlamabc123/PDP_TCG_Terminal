class Record {
  String status;
  String format;
  String you;
  String opponent;
  String yourDeck;
  String opponentDeck;
  String yourScore;
  String opponentScore;
  String date;

  Record(this.status, this.format, this.you, this.opponent, this.yourDeck,
      this.yourScore, this.opponentDeck, this.opponentScore, this.date);

  Map<String, dynamic> toJson() => {
        'status': status,
        'format': format,
        'you': you,
        'opponent': opponent,
        'yourDeck': yourDeck,
        'opponentDeck': opponentDeck,
        'yourScore': yourScore,
        'opponentScore': opponentScore,
        'date': date
      };

  void sort() {
    
  }
}
