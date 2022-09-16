class Post {
  String? title;
  String? description;
  String username;
  String date;

  Post(this.title, this.description, this.username, this.date);

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'username': username,
        'date': date
      };
}
