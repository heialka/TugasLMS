import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController _loginController = Get.put(LoginController());
  LoginView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField untuk email dengan ikon
            TextFormField(
              onChanged: _loginController.setEmail,
              decoration: InputDecoration(
                hintText: 'Masukkan Email', // Hint untuk email
                prefixIcon: Container(
                  width: 48.0, // Lebar container ikon
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email), // Icon email
                      SizedBox(width: 8.0), // Spasi antara ikon dan hint teks
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // TextField untuk password dengan ikon
            Obx(() => TextFormField(
                  onChanged: _loginController.setPassword,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Password', // Hint untuk password
                    prefixIcon: Icon(Icons.lock), // Icon password
                    suffixIcon: IconButton(
                      icon: _loginController.isObscure.value
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () => _loginController.toggleObscure(),
                    ),
                  ),
                  obscureText: _loginController.isObscure.value,
                )),
            SizedBox(height: 20.0),
            // Tombol Login
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Tombol Login
                ElevatedButton(
                  onPressed: _loginController.login,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Tombol Register
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    // Navigasi ke halaman pendaftaran
                    Get.toNamed('/register');
                  },
                  child:
                      Text('Register', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'Email: hamka@gmail.com\nPassword:123',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
