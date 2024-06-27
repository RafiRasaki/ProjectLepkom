class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  //membuat array item tugas dan membuat daftar tugas
  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Pekerjaan pagi hari', isDone: true ),
      ToDo(id: '02', todoText: 'Membeli makan', isDone: true ),
      ToDo(id: '03', todoText: 'Cek email', ),
      ToDo(id: '04', todoText: 'Team Meeting', ),
      ToDo(id: '05', todoText: 'Work on mobile apps for 2 hour', ),
      
    ];
  }
}