import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class TelaCadastros extends StatefulWidget {
  @override
  _TelaCadastrosState createState() => _TelaCadastrosState();
}

class _TelaCadastrosState extends State<TelaCadastros> {

  var textnomedocurso = TextEditingController();
  var textInmccurso = TextEditingController();

  var db = FirebaseFirestore.instance;
  void getDocumentById(String id) async{
    await db.collection("cursojs").doc(id).get().then((res){
     textnomedocurso.text = res.data()['nome do video do curso'];
     textInmccurso.text = res.data()['informação do curso'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;

    if(id !=null){
      if (textnomedocurso.text == '' && textInmccurso.text == ''){
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
              controller: textnomedocurso,
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
              controller: textInmccurso,
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
                       // iseres new doc na colection
                      await db.collection("cursojs").add(
                        {
                          "nome do video do curso" : textnomedocurso.text,
                          "informação do curso" : textInmccurso.text,
                        }
                      );
                     }else{// attzr ddss do docm
                       await db.collection("cursojs").doc(id).update(
                        {
                          "nome do video do curso" : textnomedocurso.text,
                          "informação do curso" : textInmccurso.text,
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