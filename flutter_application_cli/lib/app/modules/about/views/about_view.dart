import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Me'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto profil
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/fotoku.jpg'),
            ),
            SizedBox(height: 20),
            // Nama
            Text(
              'Al Hamka',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Deskripsi atau tentang saya
            Text(
              'Halo teman-teman, saya adalah seorang mahasiswa yang kadang bingung mau ngapain wkwk',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  // Menampilkan snackbar dengan informasi kontak
                  Get.snackbar(
                    'Kontak Saya:',
                    'Email: alhamka0327@gmail.om\nNomor Telepon: 1234567890\nInstagram: @heialka',
                    duration: Duration(seconds: 5),
                    snackPosition: SnackPosition.BOTTOM,
                    margin: EdgeInsets.all(20.0),
                    borderRadius: 10.0,
                    backgroundGradient: LinearGradient(
                      colors: [Colors.blue, Colors.green],
                    ),
                    overlayBlur: 3.0,
                    icon: Icon(Icons.person),
                  );
                },
                child: Text(
                  'Tampilkan Kontak',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
