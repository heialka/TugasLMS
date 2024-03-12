// Import paket-paket yang diperlukan
import 'dart:ffi';

import 'package:flutter/material.dart'; // Paket dasar Flutter untuk pembangunan UI
import 'package:get/get.dart'; // Paket GetX untuk manajemen state dan navigasi
import 'halaman3.dart'; // Import file HalamanTiga.dart yang berisi kelas HalamanTiga

class HalamanDua extends StatelessWidget {
  var test = "".obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Dua'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Get.dialog(AlertDialog(
                      title: Text('Halo Al Hamka'),
                      content: Text(
                          'Apakah hari ini mau berbuka dengan yang manis-manis?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Tidak")),
                        TextButton(onPressed: () {}, child: const Text("Iya")),
                      ],
                    ));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text("Tampilkan Dialog"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () async {
                  test.value = await Get.to(HalamanTiga(),
                      arguments: "Ini dari Halaman 2");
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text('Selanjutnya'),
              ),
            ),
            Obx(() => Text(test.value)),
            Text(Get.arguments),
          ],
        ),
      ),
    );
  }
}
