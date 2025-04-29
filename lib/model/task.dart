class Task{
  final int? id;
  final String title;
  final String date;
  final bool isDone;

  Task({
    this.id,
    required this.title,
    required this.date,
    this.isDone = false,
  });


  Map<String ,dynamic> toMap(){
    return {
      'id' : id,
      'title' : title,
      'date' : date,
      'isDone' : isDone ? 1 : 0
    };
  }


  factory Task.fromMap(Map<String, dynamic> map){
    return Task(
      
      date: map['date'],
      title: map['title'],
      id : map['id'],
      isDone: map['isDone'] == 1
      );
  }
}


