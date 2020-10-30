import 'package:appsh/BLogin.dart';
import 'package:appsh/infoapp.dart';
import 'package:appsh/navigationlogin.dart';
import 'package:appsh/telab.dart';
import 'package:appsh/telacadastro.dart';
import 'package:flutter/material.dart';


class Tela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size; 
    return Telab(
      varchild: SingleChildScrollView( 
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:<Widget> [
          Text(
            "app curso online",
         style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
        child: Image.asset("assets/images/Sem título.png",
         height: size.height *0.4,
         ),
        ),
        margin: EdgeInsets.symmetric(vertical: 5),
        ),
         Bt(
           text: "Logar",
           color: Colors.amber,
           press: () {Navigator.push(context , MaterialPageRoute(builder: (context) => Login()      /*{return Login();*/
           
           ),
           );
           },
         ),
          Bt(
           text: "Cadastro",
           color: Colors.yellow[600],
           press: () {Navigator.push(context, MaterialPageRoute(builder: (context){return Telacadastro();},
            ),
            );
            },
         ),
         

          Column(
           children:[
             RaisedButton(
            color: Colors.yellow,
           child: Icon(Icons.info,color: Colors.amber),
           onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context){return Info();},
            ),
            );
            },
            ),
           ],
         ),  
        ],
        ),
      ),
      );
  }
}


