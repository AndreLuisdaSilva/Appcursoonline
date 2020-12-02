class Cafe{
  String id;
  String nome;
  String onlne;

  Cafe(this.id,this.nome,this.onlne);

  Cafe.fromMap(Map<String,dynamic> map, String id){
    this.id = id ??'';
    this.nome = map['nome do video do curso'];
    this.onlne = map['informação do curso'];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(id != null){
      map["id"] = id;
    }
    map["nome do video do curso"] = nome;
    map["informação do curso"] = onlne;
    return map;
  }
}