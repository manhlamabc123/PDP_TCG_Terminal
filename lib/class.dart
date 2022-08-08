class Test {
  String name;
  String age;

  Test(this.name, this.age);

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  Test.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];
}
