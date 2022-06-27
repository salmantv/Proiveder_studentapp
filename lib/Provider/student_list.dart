import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../Model/data_models.dart';

class Hiveservice extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  List<Model> StudentList = [];
  List get student => StudentList;

  Future<void> addstudent(Model value) async {
    final stdudentDb = await Hive.openBox<Model>('Stdunt_data');
    final _id = await stdudentDb.add(value);
    value.id = _id;
    stdudentDb.put(value.id, value);
    StudentList.add(value);
    StudentList = stdudentDb.values.toList();
    notifyListeners();
  }

  Future<void> getallDetails() async {
    final stdudentDb = await Hive.openBox<Model>('Stdunt_data');
    StudentList.clear();
    StudentList = stdudentDb.values.toList();
    notifyListeners();
  }

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
}
