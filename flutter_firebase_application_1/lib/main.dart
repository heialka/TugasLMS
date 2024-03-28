import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_application_1/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_firebase_application_1/utils/loading.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA9MI6iqFCW6FLAPcJqscSXcUzRh7JiGWs",
      appId: "1:1010203564753:android:c64ac22d29a90fe40183f0",
      messagingSenderId: "1010203564753",
      projectId: "my-firebase-project-9fd06",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(LoginController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute:
                  snapshot.data != null && snapshot.data!.emailVerified == true
                      ? Routes.HOME
                      : Routes.LOGIN,
              theme: ThemeData(
                primarySwatch: Colors.indigo,
              ),
            );
          }
          return LoadingView();
        });
  }
}
