// Import paket-paket yang diperlukan
import 'package:flutter/material.dart'; // Paket dasar Flutter untuk pembangunan UI
import 'package:get/get.dart';
import 'package:tugas4_2/halaman4.dart'; // Paket GetX untuk manajemen state dan navigasi

// Deklarasi kelas HalamanTiga yang merupakan turunan dari StatelessWidget
class HalamanTiga extends StatelessWidget {
  var test = "".obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Tiga'),
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
                    Get.snackbar(
                      "Halooo",
                      "Ini contoh snack bar",
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text("Tampilkan Snack Bar"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () async {
                  test.value = await Get.to(HalamanEmpat(),
                      arguments: "Ini dari Halaman 3");
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
