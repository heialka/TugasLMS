// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final int id;
  final String judul;
  final String deskripsi;
  late bool isDone;
  final Function deleteFunction;
  final Function isChecked;

  HomePage({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.isDone,
    required this.deleteFunction,
    required this.isChecked,
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Row(
        children: [
          Container(
            child: Checkbox(
              value: widget.isDone,
              onChanged: (bool? value) {
                setState(() {
                  widget.isDone = value!;
                  widget.isChecked(widget.id, value);
                });
              },
            ),
          ),
          Expanded(
            child: ListTile(
              title: widget.isDone
                  ? Text(
                      widget.judul,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2,
                      ),
                    )
                  : Text(widget.judul),
              subtitle: widget.isDone
                  ? Text(
                      widget.deskripsi,
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2,
                      ),
                    )
                  : Text(widget.deskripsi),
              onTap: () {},
            ),
          ),
          IconButton(
            onPressed: () {
              widget.deleteFunction(widget.id);
            },
            icon: Icon(Icons.cancel, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
