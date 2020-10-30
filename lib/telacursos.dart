import 'package:appsh/Telacsos.dart';
import 'package:appsh/telappcurso.dart';
import 'package:flutter/material.dart';


class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Telacrsos(),
    );
  }
}



class Telacrsos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(left:10,top:10,right: 40),
      child: Column(
        children:[
          Row(
            children: [
              Container(
              child:Image.asset("assets/images/icone.jpeg",
           width: size.width * 0.2,
          ),
           margin: EdgeInsets.symmetric(vertical: 40),
          ),
            ],
            ),
            Text( "Cursos",
           style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),
            ),
            Container(
               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
               margin: EdgeInsets.symmetric(vertical: 20),
               width: size.width * 0.8,
               decoration: BoxDecoration(
               color: Colors.yellow,
               borderRadius: BorderRadius.circular(40),
            ),
            child:TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.amber,
              ),
              hintText: "Escreva o curso",
              ),
            ),
            ),
            

            Row(
              children: [
                Text("Curso Java"),
              Container(
               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
               margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40), 
            child: GestureDetector(
              onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context){return TelaCrso();}
              ),
              );
              },  
              child: Image.asset("assets/images/download.jpg",
           width: size.width * 0.2,
          ),
            ),
            ),
             Text("Curso C"),

            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
               margin: EdgeInsets.symmetric(vertical: 20), 
             child: GestureDetector(
              onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context){return TelaCsos();}
              ),
              );
              },
              child: Image.asset("assets/images/codigoprog.jpg",
           width: size.width * 0.2,
          ),
            ),
            ),
            ],
            ),
        ],
      ),
      ),
      
    );
  }
}