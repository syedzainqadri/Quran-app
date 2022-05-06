// import 'dart:convert';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:quranapp/Widgets/custom_snackbar.dart';

// class LessonsController extends GetxController {
//   var urls = [].obs;

//   var isLoading = true.obs;
//   var isListNull = false.obs;

//   static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
//       Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
//   getLessons(path) async {
//     isLoading(true).obs;

//     final ref = FirebaseStorage.instance.ref(path);
//     final result = await ref.listAll();

//     var url = await _getDownloadLinks(result.items);
//     print("urls $url");
//     isLoading(false);
//     urls(url).obs;
//   }
// }
