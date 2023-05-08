import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_market/myHome.dart';
import 'model/cart.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context){
      return Cart();
    },
      child: MaterialApp(
        title: 'Shopping',
        home: MyHome(),
      ),
    );
  }
}

