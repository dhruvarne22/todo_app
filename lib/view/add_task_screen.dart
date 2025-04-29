import 'package:flutter/material.dart';
import 'package:todo/controller/task_controller.dart';

class AddTaskScreen extends StatefulWidget {

final TaskController controller;

   AddTaskScreen({super.key, required this.controller});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
TextEditingController _textEditingController = TextEditingController();

List<String> option = ["Today", "Tomorrow", "Next Week", "Next Month"];

String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("Add Task")),

body: Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    children: [
      TextField(
        controller: _textEditingController,
        decoration: InputDecoration(labelText: 'Task Title'),
      ),

      DropdownButtonFormField(
        value: "Today",
        items: option.map((String value){
        return DropdownMenuItem(child: Text(value), value: value,);
      }).toList(), onChanged: (value){
        setState(() {
          selectedOption = value;
        });
      }),
  SizedBox(height : 20),
      ElevatedButton(onPressed: () async{
  if(_textEditingController.text.trim().isNotEmpty){
  
        await widget.controller.addTask(_textEditingController.text, selectedOption!);
        Navigator.pop(context, true);
  }
      }, child: Text("Save Task"))
    ],
  ),
),

    );
  }
}