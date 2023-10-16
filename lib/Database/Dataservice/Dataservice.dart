
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../models/Diet.dart';
class Dataservice{
  Future<Database> iniializedDB() async{
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'rcm.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE diet(id INTEGER PRIMARY KEY, stringjson TEXT, idUser INTEGER)",
        );
      }
    );
  }
  Future<int> insertDiet(List<Diet> diets ) async{
    int result = 0;
    final Database db = await iniializedDB();
    for (var diet in diets){
      result = await db.insert('diet', diet.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return result;
  }

  Future<List<Diet>> retrieveDiet() async{
    final Database db = await iniializedDB();
    final List<Map<String,Object?>> queryResult = await db.query('diet');
    return queryResult.map((e) => Diet.fromMap(e)).toList();
  }

  Future<void> deleteDiet(int id) async{
    final db = await iniializedDB();
    await db.delete(
      'diet',
      where: "id=?",
      whereArgs: [id],
    );
  }
}

