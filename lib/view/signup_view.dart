import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _MySignupState createState() => _MySignupState();
}

class _MySignupState extends State<SignupView> {
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var _passwordIsObscured = true;
  var _confirmPasswordIsObscured = true;

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
                      'Sign up',
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
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration:
                              _inputDecoration('Name', 'Enter your name'),
                              validator: (enteredName) {
                                return enteredName!.isEmpty
                                    ? 'Please enter your name'
                                    : null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: _inputDecoration(
                                  'Username', 'Enter your username'),
                              validator: (enteredUsername) {
                                return enteredUsername!.isEmpty
                                    ? 'Please enter your username'
                                    : null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration:
                              _inputDecoration('Email', 'Enter your email'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!EmailValidator.validate(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            // Password field
                            TextFormField(
                              obscureText: _passwordIsObscured,
                              controller: _passwordcontroller,
                              keyboardType: TextInputType.text,
                              decoration: _inputDecoration(
                                'Password',
                                'Enter your password',
                              ).copyWith(
                                suffixIcon: IconButton(
                                  icon: _passwordIsObscured
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _passwordIsObscured =
                                      !_passwordIsObscured;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your password'
                                    : null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              obscureText: _confirmPasswordIsObscured,
                              controller: _confirmpasswordcontroller,
                              keyboardType: TextInputType.text,
                              decoration: _inputDecoration(
                                'Confirm password',
                                'Re-enter your password',
                              ).copyWith(
                                suffixIcon: IconButton(
                                  icon: _confirmPasswordIsObscured
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _confirmPasswordIsObscured =
                                      !_confirmPasswordIsObscured;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please confirm your password';
                                } else if (value != _passwordcontroller.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
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
                                'Next',
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
                    const SizedBox(height: 20),
                    // Login link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a user? ',
                          style: TextStyle(
                              color: HexColor("#B22222"),
                              fontSize: 16,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: HexColor("#FF6347"),
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
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
