import 'package:appsh/navigationlogin.dart';
import 'package:appsh/telalogin.dart';
import 'package:flutter/material.dart';
import 'package:appsh/BLogin.dart';

class Telacadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Body()
      
    );
  }
}






class Body extends StatelessWidget{
 const Body({
    Key key,
 
  }) : super(key: key);

  @override

  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Telacadastrob(
      varchild:SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:  MainAxisAlignment.start,
          children: <Widget> [
            Text(
              "cadastro", style: TextStyle(fontWeight: FontWeight.bold
              ),
            ),
            Container(
          child:Image.asset("assets/images/Sem título.png",
          height: size.height * 0.4,
          ),
          
          margin: EdgeInsets.symmetric(vertical: 10),
          ),

          Textlogin(
            varchild: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: Colors.amber,
              ),
              hintText: "Email cadastro",
              ),
          ),
          ),
          Textlogin(
            varchild: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key, color: Colors.orange,
                ),
              ),
              ),
          ),
          Bt(
            text:"Cadastrar",
            color:Colors.amber,
            press:() {Navigator.push(context, MaterialPageRoute(builder: (context){return Login();}
            ),
            );
            },
          ),

           Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context){return Login();}
              ),
              );
              },
              child: Text(
                "Cadastrado",style: TextStyle(color: Colors.white70
                ),
              ),
            ),
            ),

          ],
          ),
      ),
    );
  }
}





class Telacadastrob extends StatelessWidget {
  final Widget varchild;

  const Telacadastrob({
    Key key, 
  this.varchild,
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
            child: Image.asset("assets/icons/icones.png", width: size.width * 0.2,
            ),
          ),
         
          varchild,
        ],
      ),
    );
  }
}