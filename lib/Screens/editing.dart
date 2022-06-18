import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hiveproject/Database/db_datas.dart';
import 'package:hiveproject/Model/data_models.dart';
import 'package:hiveproject/Provider/student_list.dart';
import 'package:hiveproject/Screens/home.dart';

// ignore: must_be_immutable
class Edit extends StatefulWidget {
  int index2;
  Model datas;
  Edit({Key? key, required this.datas, required this.index2}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final _formkey = GlobalKey<FormState>();
  final name = TextEditingController();
  final age = TextEditingController();
  final phone = TextEditingController();
  final place = TextEditingController();
  String imageedit = '';

  @override
  void initState() {
    name.text = widget.datas.name;
    age.text = widget.datas.age;
    phone.text = widget.datas.phonenumber;
    place.text = widget.datas.place;
    imageedit = widget.datas.img!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: ListView(children: [
          const Padding(
            padding: EdgeInsets.only(top: 60),
            child: Center(
              child: Text(
                'Now You Can Edit',
                style: TextStyle(
                    color: Color.fromARGB(255, 27, 167, 97),
                    fontSize: 35,
                    fontFamily: "BebasNeue-Regular"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: 450,
              child: Form(
                key: _formkey,
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Getimage().addimage();
                          },
                          child: CircleAvatar(
                            radius: 40,
                            child: img.trim().isNotEmpty
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: MemoryImage(
                                        const Base64Decoder()
                                            .convert(imageedit)),
                                  )
                                : Container(
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        TextFormField(
                          controller: name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "file the textfild";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter The Name',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Box is Emety";
                            } else {
                              return null;
                            }
                          },
                          controller: age,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Box is Emety";
                            } else {
                              return null;
                            }
                          },
                          controller: phone,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.00,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Box is Emety";
                            } else {
                              return null;
                            }
                          },
                          controller: place,
                          decoration: const InputDecoration(
                              hintText: 'Place', border: OutlineInputBorder()),
                        ),
                        // const SizedBox(height: 30),
                        ElevatedButton(
                            onPressed: () {
                              submit(context);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (ctx) {
                                return const Home();
                              }), (route) => false);
                            },
                            child: const Text('Upadate')),
                        const SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void submit(BuildContext context) async {
    final _namete = name.text;
    final _age = age.text;
    final _number = phone.text;
    final _plce = place.text;
    final _imaeg = img;
    final obj = Model(
        name: _namete,
        age: _age,
        phonenumber: _number,
        place: _plce,
        id: null,
        img: _imaeg);
    await Hiveservice().updateItem(widget.index2, obj);
  }
}
