import 'package:cs1635_dish_it_out_app/model/static_restaurant_list.dart';
import 'package:cs1635_dish_it_out_app/model/static_user.dart';
import 'package:cs1635_dish_it_out_app/model/user_model.dart';
import 'package:cs1635_dish_it_out_app/view/signup_view.dart';
import 'package:cs1635_dish_it_out_app/view_model/restaurant_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../view_model/user_view_model.dart';
import 'home_page_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  var _userViewModel = UserViewModel();
  var _currentUser = user_model();

  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _isObscured = true;
  var _isValid = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Start the animation when the screen opens
    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose of controllers to free resources
    _animationController.dispose();
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: Scaffold(
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            // Login content
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 175),
                // App logo or title
                RotationTransition(
                  turns: _animationController, // Apply rotation animation
                  child: Image.asset(
                    'assets/images/dioLogo.png', // Replace with your dioLogo.png path
                    height: 300, // Adjust size as needed
                    width: 600,
                  ),
                ),
/*
                const SizedBox(height: 10),
*/
                // Login form
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Login title
                            Text(
                              'Dish It Out!',
                              style: TextStyle(
                                fontSize: 40,
                                color: HexColor("#B22222"),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Username field
                            TextFormField(
                              controller: _usernamecontroller,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: 'Enter username',
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onChanged: (String enteredUsername) async {
                                _isValid = await _userViewModel.validateUser(
                                    enteredUsername, _passwordcontroller.text);
                              },
                              validator: (enteredUsername) {
                                if (enteredUsername == null ||
                                    enteredUsername.isEmpty) {
                                  return 'Please enter username';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            // Password field
                            TextFormField(
                              controller: _passwordcontroller,
                              obscureText: _isObscured,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 12.0),
                                  icon: _isObscured
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                ),
                                labelText: 'Password',
                                hintText: 'Enter password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              onChanged: (String enteredPassword) async {
                                _isValid = await _userViewModel.validateUser(
                                    _usernamecontroller.text, enteredPassword);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password';
                                } else if (!_isValid) {
                                  return 'Username or password incorrect';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            // Login button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    HexColor("#B22222"),
                                foregroundColor: Colors.white, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5, // Elevation for shadow effect
                              ).copyWith(
                                backgroundColor:
                                    WidgetStateProperty.resolveWith<Color>(
                                  (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return HexColor("#FF6347");
                                    }
                                    return HexColor("#B22222");
                                  },
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _currentUser =
                                      _userViewModel.getCurrentUser();
                                  StaticUser.user = _currentUser;
                                  StaticRestaurantList.restaurants =
                                      await RestaurantViewModel()
                                          .getMatches(_currentUser);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePageView()),
                                  );
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Sign up link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'New user? ',
                                  style: TextStyle(
                                    color: HexColor("#B22222"),
                                    fontSize: 16,
                                  ),
                                ),
                                InkWell(
                                  child: Text(
                                    'Sign up',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: HexColor("#FF6347"),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupView()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
}
