class user_model {

  int? id;
  String? username;
  String? email;
  String? name;
  String? password;
  List<String>? topDishes;
  List<String>? dietaryPreferences;
  List? reviews;
  List<int>? likedRestaurants;
  List<int>? favoriteRestaurants;


  user_model (
      {this.id,
        this.username,
        this.email,
        this.name,
        this.password,
        this.topDishes,
        this.dietaryPreferences,
        this.reviews,
        this.likedRestaurants,
        this.favoriteRestaurants});

  user_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
  }


}