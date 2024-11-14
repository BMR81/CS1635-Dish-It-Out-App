import 'package:cs1635_dish_it_out_app/view/signup_view.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context){
    return MaterialApp(
     home: Scaffold(
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text(
             'Login',
             style: TextStyle(
               fontSize: 35,
               color: Colors.teal,
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
                     onChanged: (String enteredUsername){

                     },
                     validator: (enteredUsername){
                       return enteredUsername!.isEmpty ? 'Please enter username' : null;
                     },
                   ),

                   SizedBox(height: 50,),

                   TextFormField(
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       labelText: 'Password',
                       hintText: 'Enter password',
                       prefixIcon: Icon(Icons.lock),
                       border: OutlineInputBorder(),
                     ),
                     onChanged: (String enteredPassword){

                     },
                     validator: (enteredPassword){
                       return enteredPassword!.isEmpty ? 'Please enter password' : null;
                     },
                   ),

                   SizedBox(height: 50,),

                   MaterialButton(
                     minWidth: double.infinity,
                     onPressed: (){
                       if(_formKey.currentState!.validate()){

                       }
                     },
                     child: Text('Login'),
                     color: Colors.teal,
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
                   style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
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