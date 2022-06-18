import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hiveproject/Model/data_models.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: non_constant_identifier_names
ValueNotifier<List<Model>> StudentList = ValueNotifier([]);

// ignore: non_constant_identifier_names
Future<void> Addstudent(Model value) async {
  final stdudentDb = await Hive.openBox<Model>('Stdunt_data');
  final _id = await stdudentDb.add(value);
  value.id = _id;
  stdudentDb.put(value.id, value);
  StudentList.value.add(value);
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  StudentList.notifyListeners();
}

Future<void> getallDetails() async {
  final stdudentDb = await Hive.openBox<Model>('Stdunt_data');
  StudentList.value.clear();
  StudentList.value.addAll(stdudentDb.values);
  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  StudentList.notifyListeners();
}

// ignore: non_constant_identifier_names
Future<void> Deleting(int id) async {
  final stdudentDb = await Hive.openBox<Model>('Stdunt_data');
  stdudentDb.deleteAt(id);
  getallDetails();
}

Future<void> updateItem(int index, Model obj) async {
  final stdudentDb = await Hive.openBox<Model>('Stdunt_data');
  stdudentDb.putAt(index, obj);
  getallDetails();
}

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
