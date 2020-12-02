import 'package:appsh/telacadastro.dart';
import 'package:appsh/telacursos.dart';
import 'package:flutter/material.dart';
import 'package:appsh/BLogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Tela extends StatefulWidget {
   
   
   const Tela({
    Key key,
 
  }) : super(key: key);

  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
   var txemail = TextEditingController();

  var txsenha = TextEditingController();

  var db = FirebaseFirestore.instance;

  @override
  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Telaloginb
    (varchild:  SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:  MainAxisAlignment.start,
        children: <Widget>[
          Text( 
          "Logar", style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
          child:Image.asset("assets/images/Sem título.png",
          height: size.height * 0.4,
          ),
          
          margin: EdgeInsets.symmetric(vertical: 10),
          ),
          

          Textlogin(
            varchild:  TextField( 
              controller: txemail,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.person, color: Colors.amber
                  ),
                  hintText: "Email",
              ),
            ),
            ),
            Textlogin(
              varchild: TextField(
                controller: txsenha,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key,
                  color: Colors.amber
                  ),
                ),
                ),
            ),
            Bt(
              text: "Logar",
              color: Colors.amber,
              press: () async {
                QuerySnapshot usrs = await db.collection("usuarios").where('email', isEqualTo: txemail.text).where('senha', isEqualTo: txsenha.text).get();
                if( usrs.docs.isNotEmpty){
                Navigator.push(context, MaterialPageRoute(builder: (context){return Telacrsos();}
              ),
              );
              }else{
              final snackBar = SnackBar(content: Text('     usuario nao cadastrado'     ));
               Scaffold.of(context).showSnackBar(snackBar);

            }
              },
            ),
            Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context){return Telacadastro();}
              ),
              );
              },
              child: Text(
                "Cadastro",style: TextStyle(color: Colors.white70
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







class Textlogin extends StatelessWidget {
  final Widget varchild;
  const Textlogin({
    Key key, 
    this.varchild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
        ),
        child: varchild,
    );
  }
}








class Telaloginb extends StatelessWidget {
  final Widget varchild;
  const Telaloginb({
    Key key, 
     this.varchild,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
          top:0,
          left:0,
          child: Image.asset("assets/icons/icones.png",
        width: size.width * 0.2,
        ),
        ),
       
        varchild,
        ],
        ),
    );
  }
}