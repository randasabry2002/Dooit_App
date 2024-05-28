import 'package:flutter/material.dart';
import 'package:to_do_list_app_with_flutter/screens/Splash.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAZ-MBdsMKEXg61trpDZ78rMgkXhFoGhw4",
        authDomain: "todo-flutter-app-416c5.firebaseapp.com",
        projectId: "todo-flutter-app-416c5",
        storageBucket: "todo-flutter-app-416c5.appspot.com",
        messagingSenderId: "96103219039",
        appId: "1:96103219039:web:bce59c76f5e8e0ccf880ea"
    ));
    runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: Splash(),));
}


