class VanguardCard {
  String critical;
  String effect;
  String grade;
  String image;
  String name;
  String nation;
  String number;
  String power;
  String race;
  String rarity;
  String regulation;
  String shield;
  String skill;
  String type;

  VanguardCard(
      this.critical,
      this.effect,
      this.grade,
      this.image,
      this.name,
      this.nation,
      this.number,
      this.power,
      this.race,
      this.rarity,
      this.regulation,
      this.shield,
      this.skill,
      this.type);

  Map<String, dynamic> toJson() => {
        'critical': critical,
        'effect': effect,
        'grade': grade,
        'image': image,
        'name': name,
        'nation': nation,
        'number': number,
        'power': power,
        'race': race,
        'rarity': rarity,
        'regulation': regulation,
        'shield': shield,
        'skill': skill,
        'type': type,
      };

  VanguardCard.fromJson(Map<String, dynamic> json)
      : critical = json['critical'],
        effect = json['effect'],
        grade = json['grade'],
        image = json['image'],
        name = json['name'],
        nation = json['nation'],
        number = json['number'],
        power = json['power'],
        race = json['race'],
        rarity = json['rarity'],
        regulation = json['regulation'],
        shield = json['shield'],
        skill = json['skill'],
        type = json['type'];
}
