import 'package:flutter/material.dart';



class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tela(),
      appBar:  AppBar(
       title: Text("InfoApp"
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
          "O tema é de um app de cursos online. O objetivo do app é ser plataforma de cursos online.",
           style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}