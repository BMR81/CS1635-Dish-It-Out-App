import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key : key);

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
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign up',
              style: TextStyle(
                fontFamily: "Poppins",
                  fontSize: 40,
                  color: HexColor('#00abff'),
                  fontWeight: FontWeight.bold
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String enteredName){

                      },
                      validator: (enteredName){
                        return enteredName!.isEmpty ? 'Please enter name' : null;
                      },
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Enter username',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String enteredUsername){

                      },
                      validator: (enteredUsername){
                        return enteredUsername!.isEmpty ? 'Please enter username' : null;
                      },
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter email';
                        }else if(!EmailValidator.validate(value)){
                          return 'Please enter a valid email';
                        }
                      },
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      obscureText: _passwordIsObscured,
                      controller: _passwordcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            padding: const EdgeInsetsDirectional.only(end: 12.0),
                            icon: _passwordIsObscured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                            onPressed: (){
                              setState((){
                                _passwordIsObscured = !_passwordIsObscured;
                              });
                            }
                        ),
                        labelText: 'Password',
                        hintText: 'Enter password',
                        border: OutlineInputBorder(),
                      ),

                      validator: (value){
                        return value!.isEmpty ? 'Please enter password' : null;
                      },
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      obscureText: _confirmPasswordIsObscured,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            padding: const EdgeInsetsDirectional.only(end: 12.0),
                            icon: _confirmPasswordIsObscured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                            onPressed: (){
                              setState((){
                                _confirmPasswordIsObscured = !_confirmPasswordIsObscured;
                              });
                            }
                        ),
                        labelText: 'Confirm password',
                        hintText: 'Confirm password',
                        border: OutlineInputBorder(),
                      ),

                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please confirm password';
                        }else if(value != _passwordcontroller.text){
                          return 'Password does not match';
                        }
                      },
                    ),

                    SizedBox(height: 30,),

                    MaterialButton(
                      minWidth: double.infinity,
                      onPressed: (){
                        if(_formKey.currentState!.validate()){

                        }
                      },
                      child: Text('Next'),
                      color: HexColor('#00abff'),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already a member? '),
                InkWell(
                  child: Text(
                    'Login',
                    style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                  ),
                  onTap: (){
                    Navigator.pop(context, MaterialPageRoute(builder: (context) => SignupView()));
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}