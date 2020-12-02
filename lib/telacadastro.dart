import 'package:appsh/navigationlogin.dart';
import 'package:appsh/telalogin.dart';
import 'package:flutter/material.dart';
import 'package:appsh/BLogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Telacadastro extends StatefulWidget {
  @override
  _TelacadastroState createState() => _TelacadastroState();
}

class _TelacadastroState extends State<Telacadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Body()
    );
  }
}






class Body extends StatefulWidget{
 const Body({
    Key key,
    
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var txtEmail = TextEditingController();

  var txtSenha = TextEditingController();

  var db = FirebaseFirestore.instance;
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
              controller: txtEmail,
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: Colors.amber,
              ),
              hintText: "Email cadastro",
              ),
          ),
          ),
          Textlogin(
            varchild: TextField(
              controller: txtSenha,
              decoration: InputDecoration( labelText: "senha",
                icon: Icon(Icons.vpn_key, color: Colors.orange,
                ),
              ),
              ),
          ),
          Bt(
            text:"Cadastrar",
            color:Colors.amber,
            press:() async {
                       db.collection("usuarios").add(
                       {
                        "email" : txtEmail.text,
                        "senha" : txtSenha.text,
                       }
                      );
              Navigator.push(context, MaterialPageRoute(builder: (context){return Login();}
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