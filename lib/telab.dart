import 'package:flutter/material.dart';



class Telab extends StatelessWidget {
  final Widget varchild;
  const Telab({
    Key key,
    @required this.varchild,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
          "assets/icons/icones.png",
           width: size.width * 0.2
        ),
        ),
        varchild,
        ],
      ),
    );
  }
}

