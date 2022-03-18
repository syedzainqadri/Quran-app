import 'package:get/get.dart';

class Lesson25Controller extends GetxController {
  var canDissmisse = false.obs;
  updateCanDissmisse(bool v) => canDissmisse(v);
}
