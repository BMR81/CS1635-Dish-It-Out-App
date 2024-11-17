import 'package:cs1635_dish_it_out_app/model/static_user.dart';
import 'package:cs1635_dish_it_out_app/model/user_model.dart';
import 'package:cs1635_dish_it_out_app/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../view_model/user_view_model.dart';
import 'home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key : key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<LoginView> {

  var _userViewModel = UserViewModel();

  var _currentUser = user_model();

  final _usernamecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _isObscured = true;

  var _isValid = false;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
     home: Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Image.asset(
             'assets/images/dioLogo.png',
             height: 250,
             width: 400,
           ),
           Text(
             'Login',
             style: TextStyle(
               fontFamily: 'Poppins',
               fontSize: 40,
               color: HexColor("00abff"),
               fontWeight: FontWeight.bold
             ),
           ),

           Padding(
             padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
             child: Form(
               key: _formKey,
               child: Column(
                 children: [

                   TextFormField(
                     controller: _usernamecontroller,
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       labelText: 'Username',
                       hintText: 'Enter username',
                       prefixIcon: Icon(Icons.person),
                       border: OutlineInputBorder(),
                     ),
                     style: TextStyle(
                       fontFamily: 'Poppins',
                     ),
                     onChanged: (String enteredUsername) async {
                       _isValid = await _userViewModel.validateUser(enteredUsername, _passwordcontroller.text);
                     },
                     validator: (enteredUsername){
                       return enteredUsername!.isEmpty ? 'Please enter username' : null;
                     },
                   ),

                   SizedBox(height: 50,),

                   TextFormField(
                     controller: _passwordcontroller,
                     obscureText: _isObscured,
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       suffixIcon: IconButton(
                           padding: const EdgeInsetsDirectional.only(end: 12.0),
                           icon: _isObscured ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                           onPressed: (){
                             setState((){
                               _isObscured = !_isObscured;
                             });
                           }
                       ),
                       labelText: 'Password',
                       hintText: 'Enter password',
                       prefixIcon: Icon(Icons.lock),
                       border: OutlineInputBorder(),
                     ),
                     style: TextStyle(
                       fontFamily: 'Poppins',
                     ),
                     onChanged: (String enteredPassword) async {
                       _isValid = await _userViewModel.validateUser(_usernamecontroller.text, enteredPassword);
                     },
                     validator: (value) {
                       if(value!.isEmpty){
                         return 'Please enter password';
                       }else if(!_isValid){
                         return 'Username or password incorrect';
                       }
                     },
                   ),

                   SizedBox(height: 50,),

                   MaterialButton(
                     minWidth: double.infinity,
                     onPressed: (){
                       if(_formKey.currentState!.validate()){
                         _currentUser = _userViewModel.getCurrentUser();
                         StaticUser.user = _currentUser;
                         Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                       }
                     },
                     child: Text('Login',
                         style: TextStyle(
                           fontFamily: 'Poppins',
                     )),
                     color: HexColor("00abff"),
                     textColor: Colors.white,
                   ),
                 ],
               ),
             ),
           ),

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('Not a member? '),
               InkWell(
                 child: Text(
                   'Sign up',
                   style: TextStyle(fontFamily: 'Poppins', decoration: TextDecoration.underline, color: Colors.blue),
                 ),
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => SignupView()));
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