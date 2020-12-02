import 'package:appsh/crsojs.dart';
import 'package:appsh/cursoads.dart';
import 'package:flutter/material.dart';
import 'package:appsh/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(App());
  
 /*var db = FirebaseFirestore.instance;

QuerySnapshot usrs = await db.collection("usuarios").where('email', isEqualTo: 'oa').where('senha', isEqualTo: '44980').get();
if( usrs.docs.isEmpty){
    db.collection("usuarios").add(
                       {
                        "email" : "jkkjkj",
                        "senha" : "8889868",
                       }
                      );
   }*/
 }


 


 
  
  
  

class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/principal',
      routes: {
        '/principal' : (context) => Screen(),
        '/cadastro' : (context) => TelaCadastrocr(),
        '/cadastros2':(context) => TelaCadastros(),
      },
      title: 'Curso online',
      home:Screen(),       
      theme: ThemeData(
        scaffoldBackgroundColor:  Colors.orange,
        appBarTheme: AppBarTheme(
          color: Colors.amber
        ),
      ),

      );
    
  }

}


