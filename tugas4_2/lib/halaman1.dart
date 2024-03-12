// Import paket-paket yang diperlukan
import 'dart:ffi';

import 'package:flutter/material.dart'; // Paket dasar Flutter untuk pembangunan UI
import 'package:get/get.dart'; // Paket GetX untuk manajemen state dan navigasi
import 'package:tugas4_2/halaman2.dart'; // Import file HalamanDua.dart yang berisi kelas HalamanDua

// Deklarasi kelas HalamanSatu yang merupakan turunan dari StatelessWidget
class HalamanSatu extends StatelessWidget {
  var test = "".obs;
  var user = "Teks ini dapat diubah".obs;

  void ubahHurufBesar() {
    user.value = user.value.toUpperCase();
  }

  void ubahHurufKecil() {
    user.value = user.value.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Satu"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Obx(() => Text(
                '${user.value}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => ubahHurufBesar(),
              child: Icon(Icons.arrow_upward),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () => ubahHurufKecil(),
              child: Icon(Icons.arrow_downward),
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () async {
                // Berpindah ke halaman lain
                test.value =
                    await Get.to(HalamanDua(), arguments: "Ini dari halaman 1");
              },
              backgroundColor: Colors.blue,
              child: Icon(Icons.navigate_next, color: Colors.white),
            ),
            Obx(() => Text(test.value))
          ],
        ),
      ),
    );
  }
}
