import 'package:appsh/loginscreen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(App());
}

class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curso online',
      home:Screen(),       
      theme: ThemeData(
        scaffoldBackgroundColor:  Colors.orange,
        appBarTheme: AppBarTheme(
          color: Colors.amber
        ),

        


      ),

      );

  }

}


