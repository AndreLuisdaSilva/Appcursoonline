import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class TelaCadastrocr extends StatefulWidget {
  @override
  _TelaCadastrocrState createState() => _TelaCadastrocrState();
}

class _TelaCadastrocrState extends State<TelaCadastrocr> {

  var textnomecurso = TextEditingController();
  var textinfocurso = TextEditingController();

  var db = FirebaseFirestore.instance;
  void getDocumentById(String id) async{
    await db.collection("cursoappds").doc(id).get().then((res){
     textnomecurso.text = res.data()['nome do video do curso'];
     textinfocurso.text = res.data()['informação do curso'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;

    if(id !=null){
      if (textnomecurso.text == '' && textinfocurso.text == ''){
        getDocumentById(id);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("video do curso"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
          padding: EdgeInsets.all(80),
          child: Column(children: [
            
           
            TextField(
              controller: textnomecurso,
              style:
                  TextStyle(color: Colors.amber, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                labelText: "nome do video do curso",
              ),
            ),
            SizedBox(
              height: 20,
            ),

           
            TextField(
              controller: textinfocurso,
              style:
                  TextStyle(color: Colors.amber, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                labelText: "informação do curso",
              ),
            ),
            SizedBox(
              height: 40,
            ),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140,
                  child: ClipRRect(
                   borderRadius: BorderRadius.circular(40),
                    child: RaisedButton(
                    color: Colors.amber,
                    child: Text("salvar",style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () async {
                     if( id == null){
                      await db.collection("cursoappds").add(
                        {
                          "nome do video do curso" : textnomecurso.text,
                          "informação do curso" : textinfocurso.text,
                        }
                      );
                     }else{
                       await db.collection("cursoappds").doc(id).update(
                        {
                          "nome do video do curso" : textnomecurso.text,
                          "informação do curso" : textinfocurso.text,
                        }
                      );
                     }
                      Navigator.pop(context);

                    },
                  ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 140,
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                   child: RaisedButton(
                    color: Colors.amber,
                    child: Text("cancelar",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ),
                ),
              ],
            ),
          ])),
      backgroundColor: Colors.orange,
    );
  }
  }