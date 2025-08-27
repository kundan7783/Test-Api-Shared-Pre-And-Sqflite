import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' ;

class DbHelper {
   Database? myDB;
    String TABLE_TASK = "tasks";
    String COLUMN_ID = "id";
    String COLUMN_NAME = "name";
    String COLUMN_DESCRIPITION = "description";
    String COLUMN_STATUS= "status";


   Future<Database> getDB() async {
     return myDB ??= await  openDB();
   }
   Future<Database> openDB() async {
     String path= await getDatabasesPath();
     String pathName= join(path,"mytest.db");
     return openDatabase(pathName,onCreate: (db, version) {
       db.execute("CREATE TABLE $TABLE_TASK($COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,$COLUMN_NAME TEXT,$COLUMN_DESCRIPITION TEXT,$COLUMN_STATUS TEXT)");
     },version: 1);
   }
   Future<bool> addTaskFromDataBase(Map<String,dynamic> addTask) async {
     var db= await getDB();
      int success= await db.insert(TABLE_TASK, addTask);
      return success > 0;
   }
   Future<List<Map<String,dynamic>>> getAllTaskFromDatabase() async {
     var db= await getDB();
     return db.query(TABLE_TASK);
   }
}
