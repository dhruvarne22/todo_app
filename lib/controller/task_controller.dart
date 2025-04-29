import 'package:todo/controller/database_helper.dart';
import 'package:todo/model/task.dart';

class TaskController {

List<Task> _tasks = [];

List<Task> get tasks => _tasks;


Future<void> loadTasks() async{
  _tasks = await DatabaseHelper().getTask();
}


Future<void>  addTask(String title, String date) async {
  final task = Task(title: title , date : date);
await DatabaseHelper().insertTask(task);
await loadTasks();
}


Future<void>  updateTaskStatus(Task task, bool isDone) async{
  final updatedTask = Task(id: task.id, title: task.title, date : task.date , isDone : isDone);
  await DatabaseHelper().updateTask(updatedTask);
  await loadTasks();
}


Future<void>  deleteTask(Task task) async{
  if(task.id != null){
    await DatabaseHelper().deleteTask(task.id!);
    await loadTasks();
  }else{
    print("TASK ID IS NULL");
  }
}

}
