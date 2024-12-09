import 'package:cs1635_dish_it_out_app/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/static_variables.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<ProfileView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String firstDish = StaticVariables.user!.firstDish.toString();
  String secondDish = StaticVariables.user!.secondDish.toString();
  String thirdDish = StaticVariables.user!.thirdDish.toString();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          child: Column(
            children: [
              SafeArea(
                child: Text(
                  "User Options",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 40,
                    color: HexColor("B22222"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                                'Are you sure?',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: HexColor("B22222"),
                                ),
                              ),
                            content: Text(
                                'Do you really want to log out of the app?',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            actions: [
                              TextButton(
                                  child: Text('No'),
                                onPressed: (){
                                    Navigator.of(context).pop(false);
                                },
                              ),
                              TextButton(
                                child: Text('Yes'),
                                onPressed: (){
                                  StaticVariables.likedRestaurants?.clear();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginView()),
                                  );
                                },
                              ),
                            ],
                          );
                        }
                    );
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Image.asset(
                'assets/images/profileBackground.png',
                fit: BoxFit.cover,
              ),
            ),
            // UI Elements upfront
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: HexColor("B22222"),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage:
                        AssetImage('assets/images/profilePhoto.png'),
                  ),
                ),
                Text(
                  StaticVariables.user!.name.toString(),
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 40,
                    color: HexColor("B22222"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Divider(color: Colors.white),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Top Dishes",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                        color: HexColor("B22222"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDishColumn(firstDish),
                    _buildDishColumn(secondDish),
                    _buildDishColumn(thirdDish),
                  ],
                ),
                Divider(color: Colors.white),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Review Log",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 25,
                        color: HexColor("B22222"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Savor the memories. Start reviewing!",
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 18,
                      color: HexColor("B22222"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildDishColumn(String dishName) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset(
            'assets/images/$dishName.png',
            height: 100,
            width: 100,
          ),
        ),
        Text(
          dishName.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            color: HexColor("B22222"),
          ),
        ),
      ],
    );
  }
}
