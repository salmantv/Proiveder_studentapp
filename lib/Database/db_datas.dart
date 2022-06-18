import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

String img = '';

class Getimage extends GetxController {
  addimage() async {
    final pickimage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickimage == null) {
      return;
    } else {
      update();
      final bytes = File(pickimage.path).readAsBytesSync();
      img = base64Encode(bytes);
    }
  }
}
