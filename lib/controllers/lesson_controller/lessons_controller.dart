import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quranapp/Widgets/custom_snackbar.dart';

class LessonsController extends GetxController {
  var urls = [].obs;

  var isLoading = true.obs;
  var isListNull = false.obs;

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
  getLessons(path) async {
    isLoading(true).obs;

    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    var url = await _getDownloadLinks(result.items);
    print("urls $url");
    isLoading(false);
    urls(url).obs;

    // if(debugMode)print(detail);
//     if (detail != null) {
//       try {
//         userInfoResponse.value = customerModelFromJson(detail.toString());
//         if (userInfoResponse.value.customers == null) {
//           print(" data is null "
//               "");
//           //successSnackbarReplace(0,registerResp.value.error.toString());
//           isListNull(true).obs;
//         }
//         isLoading(false).obs;
//       } catch (e) {
//         isLoading(false).obs;
//         var response = json.decode(detail.toString());
//         // if(response["data"]==[]){
//         //   isListNull(true).obs;
//         // }
//         if (response["success"] == false) {
//           errorSnackbar(response["error"]);
//         } else {
//           errorSnackbar("Something went wrong, Try again".tr);
//         }
//       }
//     } else {
//       isLoading(false).obs;
// //        errorSnackbar("Something went wrong, try again");
//     }
  }
}
