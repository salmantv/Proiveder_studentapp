import 'package:hive_flutter/adapters.dart';
part 'data_models.g.dart';

@HiveType(typeId: 1)
class Model  {
  @HiveField(1)
  String name;

  @HiveField(2)
  String age;

  @HiveField(3)
  String phonenumber;

  @HiveField(4)
  String place;
  @HiveField(0)
  int? id;
  @HiveField(5)
  String? img;

  Model(
      {required this.name,
      required this.age,
      required this.phonenumber,
      required this.place,
      required this.id,
      required this.img});
}
