import 'package:sqflite/sqflite.dart';
import 'package:TaskMarker/repository/database_connection.dart';

class Repository{
  DatabaseConnection _databaseConnection;

  Repository(){
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;
  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  //Inserting data
  insertData(table, data) async{
    var connection = await database;
    return await connection.insert(table, data);
  }

  //Reading data
  readData(table) async{
    var connection = await database;
    return await connection.query(table);
  }

  deleteDataById(table,itemId) async{
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

  updateData(table,data) async{
    var connection = await database;
    return await connection.update(table,data,where: 'id = ?',whereArgs: [data['id']]);
  }

  readDataById(table, itemId) async{
        print(itemId.runtimeType);
    var connection = await database;
    return await connection.query(table,where: 'id = ?',whereArgs: itemId);
  }
}

