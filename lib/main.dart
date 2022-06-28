import 'package:flutter/material.dart';
import 'package:learn_handle_response/state/app_state.dart';
import 'package:learn_handle_response/view/api_view.dart';
import 'package:learn_handle_response/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //we have only one provider so we are using only changeNotifierProvider
    return ChangeNotifierProvider(create:(context) => AppState(),
    child:const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
    );

  }
}

