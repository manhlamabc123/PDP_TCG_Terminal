class Achievement {
  String name;
  String date;
  int top;

  Achievement(this.name, this.date, this.top);

  Map<String, dynamic> toJson() => {'name': name, 'date': date, 'top': top};

  String getName() {
    return name;
  }

  int getTop() {
    return top;
  }

  String getDate() {
    return date;
  }
}
