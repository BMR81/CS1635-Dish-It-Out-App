import 'package:cs1635_dish_it_out_app/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key : key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<LoginView> {

//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ListPicturesViewModel>(context, listen: false).fetchPictures();
// //you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
//   }

  final _formKey = GlobalKey<FormState>();

  var _isObscured = true;

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
                     onChanged: (String enteredUsername){
                     },
                     validator: (enteredUsername){
                       return enteredUsername!.isEmpty ? 'Please enter username' : null;
                     },
                   ),

                   SizedBox(height: 50,),

                   TextFormField(
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
                     validator: (value){
                       return value!.isEmpty ? 'Please enter password' : null;
                     },
                   ),

                   SizedBox(height: 50,),

                   MaterialButton(
                     minWidth: double.infinity,
                     onPressed: (){
                       if(_formKey.currentState!.validate()){

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