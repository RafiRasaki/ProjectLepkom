import 'package:flutter/material.dart';
import 'package:todolist/model/todo.dart';
import 'package:todolist/shared/theme.dart';
import 'package:todolist/widget/todo_item.dart';

import '../shared/theme.dart';

class Home extends StatefulWidget{
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //membuat variable untuk merender data dari file model
  final todoList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGGreenColor,
      appBar: _buildAppBar(),

      //membuat tampilan
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20, 
              vertical: 15,
              ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,),
                        child: Text(
                          'Catatan Kegiatan',
                           style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for(ToDo todo in _foundToDo.reversed)
                      ToDoItem(
                        todo: todo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ),
                    ],
                  ),
                )
              ]
            ),
          ),

          //membuuat untuk menambahkan todo list item
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20, 
                      right: 20,
                      left:  20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                      ),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Tambahkan ToDoList Baru',
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                   style: TextStyle(
                    fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kblue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ],),
         ),
        ],
      ),
    );
  }

// function untuk merubah checkbox
  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    }); 
  }

// function untuk delete item
  void _deleteToDoItem(String id){
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

// function untuk menambahkan item item
  void _addToDoItem(String toDo) {
    setState(() {
      todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

// function untuk memfilter dan mencari keyword
  void _runFilter(String enterdKeyword){
    List<ToDo> results = [];
    if (enterdKeyword.isEmpty){
      results = todoList;
    } else {
      results = todoList
      .where((item) => item.todoText!
      .toLowerCase()
      .contains(enterdKeyword.toLowerCase()))
      .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox(){
    return Container(
     //jarak icon search sebelah kiri
     padding: EdgeInsets.symmetric(horizontal: 15),
     decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20)
      ),
          child: TextField(
            //mencari keyword
            onChanged: ((value) => _runFilter(value)),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search, 
                color: kBlackColor, 
                size: 20,
              ),
          //jarak kursor icon
          prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
          ),
         border: InputBorder.none,
         hintText: 'Search',
         hintStyle: TextStyle(color: kGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kBGGreenColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        //Membuat icon menu
        Icon(
          Icons.menu, 
          color: kBlackColor, 
          size: 30,
          ),

        //Membuat pas poto
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/PasPoto1.jpeg'),
            ),
          ),
        ]),
       );
  }
}