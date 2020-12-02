import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'csosrC.dart';
import 'dart:async';


class TelaCrso extends StatefulWidget {
  @override
  _TelaCrsoState createState() => _TelaCrsoState();
}

class _TelaCrsoState extends State<TelaCrso> {

  @override
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tela(),
      appBar:  AppBar(
       title: Text("Curso Java"
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

    List<Cafe> cursojs = List();

  StreamSubscription<QuerySnapshot> listen;


  @override

  void initState(){
    super.initState();

    
    listen?.cancel();
    listen = db.collection("cursojs").snapshots().listen((res) { 

      
      setState(() {
        
        cursojs = res.docs.map(
            (e) => Cafe.fromMap(e.data(),e.id) ).toList();
      });

    });
  }





  Widget build(BuildContext context) {
    return Container(
    child: Scaffold(
      body: StreamBuilder<QuerySnapshot>(
         stream: db.collection("cursojs").snapshots(),
        builder: (context,snapshot){
          
        
          switch(snapshot.connectionState){

            case ConnectionState.none:
              return Center(child: Text('Erro de conexão.'));
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return ListView.builder(
                itemCount: cursojs.length,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: Icon(Icons.play_arrow),
                    title: Text(cursojs[index].nome, style: TextStyle(fontSize: 24)),
                    subtitle: Text(cursojs[index].onlne, style: TextStyle(fontSize: 16)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        db.collection("cursojs").doc(cursojs[index].id).delete();
                      },
                    ),
                    onTap:(){
                      Navigator.pushNamed(context, '/cadastros2', arguments: cursojs[index].id);
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
          Navigator.pushNamed(context, "/cadastros2", arguments: null);
        },
      ),
    ),
    );
  }
}
