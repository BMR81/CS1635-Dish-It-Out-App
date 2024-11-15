import 'package:flutter/cupertino.dart';

import 'package:cs1635_dish_it_out_app/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Dish It Out App'),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'Poppins', // Set the default font to Poppins
            fontSize: 16,
            color: CupertinoColors.black,
          ),
          child: LoginView(),
        ),
      ),
    );
  }
}
