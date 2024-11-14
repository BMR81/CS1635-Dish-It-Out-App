import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key : key);

  @override
  _MySignupState createState() => _MySignupState();
}

class _MySignupState extends State<SignupView> {

//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ListPicturesViewModel>(context, listen: false).fetchPictures();
// //you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
//   }

  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
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
              'Sign up',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
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
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String enteredEmail){

                      },
                      validator: (enteredEmail){
                        return enteredEmail!.isEmpty ? 'Please enter email' : null;
                      },
                    ),

                    SizedBox(height: 20,),

                    TextFormField(
                      controller: _passwordcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
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
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
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