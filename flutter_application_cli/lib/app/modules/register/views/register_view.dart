import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField untuk email
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan Email', // Hint untuk email
                prefixIcon: Icon(Icons.email), // Icon email
              ),
            ),
            SizedBox(height: 20.0),
            // TextField untuk password
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Masukkan Password', // Hint untuk password
                prefixIcon: Icon(Icons.lock), // Icon password
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            // Tombol Register
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                // Logika untuk mendaftarkan pengguna
                Get.snackbar('Register', 'User registered successfully');
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),
            // Link "Sudah punya akun?"
            TextButton(
              onPressed: () {
                // Navigasi kembali ke halaman login
                Get.offNamed('/login');
              },
              child: Text('Sudah punya akun? Masuk di sini'),
            ),
          ],
        ),
      ),
    );
  }
}
