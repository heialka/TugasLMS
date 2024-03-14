import 'package:get/get.dart';

class LoginController extends GetxController {
  // Variabel untuk menyimpan email dan password
  var email = ''.obs;
  var password = ''.obs;
  var isObscure = true.obs;

  // Metode untuk memperbarui nilai email
  void setEmail(String value) => email.value = value;

  // Metode untuk memperbarui nilai password
  void setPassword(String value) => password.value = value;

  void toggleObscure() => isObscure.value = !isObscure.value;

  // Metode untuk memeriksa kecocokan email dan password
  void login() {
    // Sederhana, silakan sesuaikan dengan kebutuhan
    if (email.value == 'hamka@gmail.com' && password.value == '123') {
      Get.toNamed('/about'); // Ganti
    } else {
      // Jika otentikasi gagal, tampilkan pesan kesalahan
      Get.snackbar('Error', 'Email dan Password salah');
    }
  }

  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
