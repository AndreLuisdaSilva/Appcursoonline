import 'package:flutter/material.dart';



class TelaCrso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tela(),
      appBar:  AppBar(
       title: Text("Curso JV"
       ),
      ),
    );
  }
}


class Tela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size
    return ListView(
      children: [
        Text(
          "Curso Java.",
           style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}