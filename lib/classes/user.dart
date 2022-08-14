class User {
  
  String username;
  String password;

  User(this.username, this.password);

  Map<String, dynamic> toJson() => {
        
        'username': username,
        'password': password,
      };
}
