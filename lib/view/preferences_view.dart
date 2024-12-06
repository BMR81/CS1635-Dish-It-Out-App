import 'package:cs1635_dish_it_out_app/model/static_user.dart';
import 'package:cs1635_dish_it_out_app/view/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/static_restaurant_list.dart';
import '../model/user_model.dart';
import '../view_model/restaurant_view_model.dart';
import '../view_model/user_view_model.dart';

class PreferencesView extends StatefulWidget {
  const PreferencesView({Key? key}) : super(key: key);

  @override
  _MyPreferencesState createState() => _MyPreferencesState();
}

class _MyPreferencesState extends State<PreferencesView> {

  Color _veganColor = Colors.white;
  Color _vegetarianColor = Colors.white;
  Color _ketoColor = Colors.white;
  Color _pizzaColor = Colors.white;
  Color _burgersColor = Colors.white;
  Color _tacosColor = Colors.white;
  Color _wingsColor = Colors.white;
  Color _saladColor = Colors.white;

  Color _warningMessageColor = HexColor("#FFFFFF");

  List<String> favoriteDishes = <String>[];
  String preference = "";

  var _newUser = StaticUser.user;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Quicksand"),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/signup_background.png',
                fit: BoxFit.cover,
              ),
            ),
            // Sign up content
            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      'Set Preferences',
                      style: TextStyle(
                        fontFamily: "Quicksand",
                        fontSize: 45,
                        color: HexColor("#B22222"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          'Dietary Preferences',
                          style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: 25,
                            color: HexColor("#B22222"),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (_veganColor == Colors.white &&
                                  preference == "") {
                                setState(() {
                                  _veganColor = Colors.grey;
                                  preference = "vegan";
                                });
                              } else if (preference == "vegan") {
                                setState(() {
                                  _veganColor = Colors.white;
                                  preference = "";
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _veganColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text("Vegan"),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: InkWell(
                              onTap: () {
                                if (_vegetarianColor == Colors.white &&
                                    preference == "") {
                                  setState(() {
                                    _vegetarianColor = Colors.grey;
                                    preference = "vegetarian";
                                  });
                                } else if (preference == "vegetarian") {
                                  setState(() {
                                    _vegetarianColor = Colors.white;
                                    preference = "";
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _vegetarianColor,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text("Vegetarian"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_ketoColor == Colors.white &&
                                  preference == "") {
                                setState(() {
                                  _ketoColor = Colors.grey;
                                  preference = "keto";
                                });
                              } else if (preference == "keto") {
                                setState(() {
                                  _ketoColor = Colors.white;
                                  preference = "";
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _ketoColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text("Keto"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          'Favorite Dishes (Pick 3)',
                          style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: 25,
                            color: HexColor("#B22222"),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (_pizzaColor == Colors.white &&
                                  favoriteDishes.length <= 2) {
                                setState(() {
                                  _pizzaColor = Colors.grey;
                                  favoriteDishes.add("pizza");
                                });
                              } else {
                                setState(() {
                                  _pizzaColor = Colors.white;
                                  favoriteDishes.remove("pizza");
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _pizzaColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text("Pizza"),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: InkWell(
                              onTap: () {
                                if (_burgersColor == Colors.white &&
                                    favoriteDishes.length <= 2) {
                                  setState(() {
                                    _burgersColor = Colors.grey;
                                    favoriteDishes.add("burger");
                                  });
                                } else {
                                  setState(() {
                                    _burgersColor = Colors.white;
                                    favoriteDishes.remove("burger");
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _burgersColor,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text("Burgers"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_tacosColor == Colors.white &&
                                  favoriteDishes.length <= 2) {
                                setState(() {
                                  _tacosColor = Colors.grey;
                                  favoriteDishes.add("tacos");
                                });
                              } else {
                                setState(() {
                                  _tacosColor = Colors.white;
                                  favoriteDishes.remove("tacos");
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _tacosColor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text("Tacos"),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: InkWell(
                              onTap: () {
                                if (_wingsColor == Colors.white &&
                                    favoriteDishes.length <= 2) {
                                  setState(() {
                                    _wingsColor = Colors.grey;
                                    favoriteDishes.add("wings");
                                  });
                                } else {
                                  setState(() {
                                    _wingsColor = Colors.white;
                                    favoriteDishes.remove("wings");
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _wingsColor,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text("Wings"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                        child: InkWell(
                          onTap: () {
                            if (_saladColor == Colors.white &&
                                favoriteDishes.length <= 2) {
                              setState(() {
                                _saladColor = Colors.grey;
                                favoriteDishes.add("salad");
                              });
                            } else {
                              setState(() {
                                _saladColor = Colors.white;
                                favoriteDishes.remove("salad");
                              });
                            }
                          },
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              color: _saladColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text("Salad"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: HexColor("#B22222"),
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5, // Elevation for shadow effect
                      ).copyWith(
                        backgroundColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.pressed)) {
                              return HexColor("#FF6347");
                            }
                            return HexColor("#B22222");
                          },
                        ),
                      ),
                      onPressed: () async {
                        if (favoriteDishes.length == 3) {
                          _newUser?.dietaryPreference = preference;
                          _newUser?.firstDish = favoriteDishes.elementAt(0);
                          _newUser?.secondDish = favoriteDishes.elementAt(1);
                          _newUser?.thirdDish = favoriteDishes.elementAt(2);

                          StaticUser.user = _newUser;

                          StaticRestaurantList.restaurants =
                              await RestaurantViewModel().getMatches(_newUser!);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePageView()),
                          );
                        }else{
                          setState(() {
                            _warningMessageColor = HexColor("#B22222");
                          });
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Center(
                      child: Text(
                        'Please select 3 favorite dishes',
                        style: TextStyle(
                          fontSize: 20,
                          color: _warningMessageColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 150),
                    // Login link
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String labelText, String hintText) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey, width: 2.0),
      ),
      fillColor: Colors.white,
      filled: true,
    );
  }
}
