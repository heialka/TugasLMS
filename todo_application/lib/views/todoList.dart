import 'package:flutter/material.dart';
import '../utils/DbHelper.dart';
import '../models/todo.dart';
import '../views/homePage.dart';

class TodoList extends StatelessWidget {
  final Function deleteFunction;
  final Function isChecked;

  final DbHelper db = DbHelper();

  TodoList({
    required this.deleteFunction,
    required this.isChecked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Todo>>(
        future: db.queryAllRows(),
        builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            var data = snapshot.data!;
            var dataLength = data.length;

            return dataLength == 0
                ? const Center(
                    child: Text(
                      "Data Tidak di Temukan",
                      style: TextStyle(color: Colors.white), // Warna teks putih
                    ),
                  )
                : ListView.builder(
                    itemCount: dataLength,
                    itemBuilder: (context, i) => HomePage(
                      id: data[i].id!,
                      judul: data[i].judul,
                      deskripsi: data[i].deskripsi,
                      isDone: data[i].isDone,
                      deleteFunction: deleteFunction,
                      isChecked: isChecked,
                    ),
                  );
          }
        },
      ),
    );
  }
}
