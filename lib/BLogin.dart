import 'package:flutter/material.dart';


class Bt extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const Bt({
    Key key,
     this.text,
     this.press,
     this.color,
     this.textColor = Colors.white70,
    
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: size.width * 0.4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
               child: RaisedButton(
          
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: color,
          onPressed: press,
         child: Text(
            text,
          style: TextStyle(color: textColor 
          ),
         ),
         ),
      ),
    );
  }
}