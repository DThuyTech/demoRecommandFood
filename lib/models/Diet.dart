class Diet {
  int id;
  String stringjson;
  int idUser;

  Diet(this.id, this.stringjson, this.idUser);
  Diet.fromMap(Map<String, dynamic> result)
  : id = result["id"],
  stringjson = result["stringjson"],
  idUser = result["idUser"];
  Map<String,Object> toMap(){
      return{
        'id' :id,
        'stringjson':stringjson,
        'idUser':idUser
      };
  }
}