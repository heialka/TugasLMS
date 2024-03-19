import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() {
    counter = box.read('count') ?? 0;
  }

  void tambah() {
    setState(() {
      counter++;
      box.write('count', counter);
    });
  }

  void kurang() {
    setState(() {
      counter--;
      box.write('count', counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    box.writeIfNull('count', 0);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Belajar Get Storage",
            style: TextStyle(
              color: Colors.white, // Ganti dengan warna yang diinginkan
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Angka Saat ini :"),
              Text(
                '${box.read('count')}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        (counter != 0) ? kurang() : null;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        tambah();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
