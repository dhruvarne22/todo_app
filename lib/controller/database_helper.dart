import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/model/task.dart';


class DatabaseHelper{
static Database? _db;


Future<Database> get db async{
  _db ??= await initDb(); 
  return _db!;
}

// CRUD 

Future<Database> initDb() async{


  final path = join(await getDatabasesPath(), 'todo.db');

  return await openDatabase(
    path, 
    version: 2,
    onCreate: (db, version) async {
      await db.execute('''
CREATE TABLE tasks(
id INTEGER PRIMARY KEY  AUTOINCREMENT,
title TEXT,
date TEXT,
isDone INEGER
)
''');
    }
  );

  
}





// CREATE
Future<int> insertTask(Task task) async{
  final dbClient = await db;
  return await dbClient.insert('tasks', task.toMap() );
}

// READ
Future<List<Task>> getTask() async{
  final dbClient = await db;

  final List<Map<String, dynamic>> maps  =  await dbClient.query('tasks');

//   List<Task> tasks = [];
//   maps.forEach((map){
//     Task task = Task.fromMap(map);
// tasks.add(task);
//   });


// return tasks;
return List.generate(maps.length, (i) => Task.fromMap(maps[i]) );
}


// UPDATE
Future<int> updateTask(Task task) async{
    final dbClient = await db;
    return await dbClient.update('tasks', task.toMap(),
 where: 'id = ?', 
 whereArgs: [task.id]);
}

// Delete 
deleteTask(int id) async{
  final dbClient = await db;
  return await dbClient.delete('tasks', where: 'id = ?', whereArgs: [id]);
}


}