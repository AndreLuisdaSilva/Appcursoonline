import 'package:flutter/material.dart';



class TelaCsos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tela(),
      appBar:  AppBar(
       title: Text("Curso C"
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
          "Curso C",
           style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}