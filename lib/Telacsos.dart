import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'csosrC.dart';
import 'dart:async';


class TelaCsos extends StatefulWidget {
  @override
  _TelaCsosState createState() => _TelaCsosState();
}

class _TelaCsosState extends State<TelaCsos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tela(),
      appBar:  AppBar(
       title: Text("Curso C"
       ),
      ),
    );
  }
}


class Tela extends StatefulWidget {
  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
   var db = FirebaseFirestore.instance;

    List<Cafe> cursoappds = List();

  StreamSubscription<QuerySnapshot> listen;


  @override

  void initState(){
    super.initState();

  
    listen?.cancel();
    listen = db.collection("cursoappds").snapshots().listen((res) { 

     
      setState(() {
        
        cursoappds = res.docs.map(
            (e) => Cafe.fromMap(e.data(),e.id) ).toList();
      });

    });
  }





  Widget build(BuildContext context) {
    return Container(
    child: Scaffold(
      body: StreamBuilder<QuerySnapshot>(
         stream: db.collection("cursoappds").snapshots(),
        builder: (context,snapshot){
          
        
          switch(snapshot.connectionState){

            case ConnectionState.none:
              return Center(child: Text('Erro de conexão.'));
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return ListView.builder(
                itemCount: cursoappds.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(cursoappds[index].nome, style: TextStyle(fontSize: 24)),
                    subtitle: Text(cursoappds[index].onlne, style: TextStyle(fontSize: 16)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        db.collection("cursoappds").doc(cursoappds[index].id).delete();
                      },
                    ),
                    onTap:(){
                      Navigator.pushNamed(context, '/cadastro', arguments: cursoappds[index].id);
                    },

                  );
                }
              );
          }
        }
      ),
      

       floatingActionButton: FloatingActionButton(
        //foregroundColor: Colors.white,
        backgroundColor: Colors.amber,
        elevation: 0,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "/cadastro", arguments: null);
        },
      ),
    ),
    

           
    );
  }
}