import 'package:flutter/cupertino.dart';

import 'package:cs1635_dish_it_out_app/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CupertinoApp(
        home: LoginView(),

    );
  }
}
