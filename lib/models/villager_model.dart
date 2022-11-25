class villager {
  String? name;
  String? imageUrl;
  String? species;
  String? personality;
  String? gender;
  String? birthdayMonth;
  String? birthdayDay;

  villager({
    this.name,
    this.imageUrl,
    this.species,
    this.personality,
    this.gender,
    this.birthdayMonth,
    this.birthdayDay,
  });

  villager.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['image_url'];
    species = json['species'];
    personality = json['personality'];
    gender = json['gender'];
    birthdayMonth = json['birthday_month'];
    birthdayDay = json['birthday_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['species'] = this.species;
    data['personality'] = this.personality;
    data['gender'] = this.gender;
    data['birthday_month'] = this.birthdayMonth;
    data['birthday_day'] = this.birthdayDay;

    return data;
  }
}
