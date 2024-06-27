import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/shared/theme.dart';

class ToDoItem extends StatelessWidget {
final ToDo todo;
final onToDoChanged;
final onDeleteItem;

const ToDoItem({
  Key? key,
   required this.todo,
   required this .onToDoChanged,
   required this.onDeleteItem,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //memberi jarak tiap konten
      margin: EdgeInsets.only(bottom: 20),
      //membuat checkbox
      child: ListTile(
        onTap: () {
          //print('clik on todo item');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),

        //bentuk bordernya
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20, 
          vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank,
          color: kblue,
        ),
        title: Text(
          todo.todoText!,
           style: TextStyle(fontSize: 16, 
           color: kBlackColor, 
           decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),

        //membuat icon delete
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: kRedColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              //print('clik on delete icon');
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}