import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorSnackbar(String successMsg) {
  return Get.snackbar(
    "Error".tr,
    successMsg,
    icon: const Icon(
      Icons.error_outline,
      color: Colors.white,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    duration: Duration(seconds: 2),
    colorText: Colors.white,
    snackbarStatus: (status) {
      if (status == SnackbarStatus.CLOSED) {}
    },
  );
}

successSnackbar(String successMsg) {
  return Get.snackbar(
    "Notification".tr,
    successMsg,
    icon: const Icon(
      Icons.check,
      color: Colors.white,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Get.theme.primaryColor,
    colorText: Colors.white,
    snackbarStatus: (status) {
      if (status == SnackbarStatus.CLOSED) {}
    },
  );
}

successSnackbarReplace(int index, String successMsg) {
  return Get.snackbar(
    "notification".tr,
    successMsg,
    icon: const Icon(
      Icons.check,
      color: Colors.white,
    ),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Get.theme.primaryColor,
    colorText: Colors.white,
    snackbarStatus: (status) {},
  );
}
