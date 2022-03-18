import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quranapp/Screens/splashScreen.dart';
import 'package:quranapp/Utilities/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  await Hive.openBox(DB_lesson);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ignore: deprecated_member_use
        accentColor: kGoldenColor,
      ),
      home: SplashScreen(),
    );
  }
}
