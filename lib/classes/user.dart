class User {
  String id;
  String username;
  String password;

  User(this.id, this.username, this.password);

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
      };
}
