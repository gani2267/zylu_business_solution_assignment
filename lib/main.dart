import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zylu_business_solution_assignment/home_screen.dart';
import 'package:zylu_business_solution_assignment/screens/data_uploader_screen.dart';
import 'package:zylu_business_solution_assignment/theme/styles.dart';

import 'firebase_options.dart';
import 'package:get/get.dart';

// only for uploading data to firebase
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zylu Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'ibmPlexSans',
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        dividerColor: grey,
        splashColor: grey,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: grey),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: almostWhite)),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            focusColor: almostWhite,
            labelStyle: bodyText2White60),
      ),
      home: HomeScreen(),
    );
  }
}
