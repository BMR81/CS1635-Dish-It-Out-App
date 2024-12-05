import 'package:cs1635_dish_it_out_app/model/static_user.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../view_model/user_view_model.dart';

class PreferencesView extends StatefulWidget {
  const PreferencesView({Key? key}) : super(key: key);

  @override
  _MyPreferencesState createState() => _MyPreferencesState();
}

class _MyPreferencesState extends State<PreferencesView> {
  var _userViewModel = UserViewModel();

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
                        fontSize: 40,
                        color: HexColor("#B22222"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [


                            const SizedBox(height: 30),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                              ).copyWith(
                                backgroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                    if (states.contains(WidgetState.pressed)) {
                                      return HexColor("FF6347");
                                    }
                                    return HexColor("B22222");
                                  },
                                ),
                                foregroundColor: WidgetStateProperty.all(
                                  Colors.white, // Text color
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
        borderSide:
        const BorderSide(color: Colors.grey, width: 2.0),
      ),
      fillColor: Colors.white,
      filled: true,
    );
  }
}
