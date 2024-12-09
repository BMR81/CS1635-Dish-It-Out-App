class user_model {
  int? id;
  String? username;
  String? email;
  String? name;
  String? password;
  String? firstDish;
  String? secondDish;
  String? thirdDish;
  String? dietaryPreference;

  user_model(
      {this.id,
      this.username,
      this.email,
      this.name,
      this.password,
      this.firstDish,
      this.secondDish,
      this.thirdDish,
      this.dietaryPreference});

  user_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    firstDish = json['first_dish'];
    secondDish = json['second_dish'];
    thirdDish = json['third_dish'];
  }
}
