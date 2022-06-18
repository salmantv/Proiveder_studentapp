import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hiveproject/Database/db_datas.dart';
import 'package:hiveproject/Model/data_models.dart';

// ignore: must_be_immutable
class FormHome extends StatelessWidget {
  final name = TextEditingController();
  final age = TextEditingController();
  final number = TextEditingController();
  final place = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool valueschaking = false;

  FormHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Getimage _control = Get.put(Getimage());

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Fill The Form',
                  style: TextStyle(
                      color: Color.fromARGB(255, 27, 167, 97),
                      fontSize: 35,
                      fontFamily: "BebasNeue-Regular"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: Card(
                elevation: 20,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () async {
                          _control.addimage();
                        },
                        child: GetBuilder<Getimage>(builder: (ctxt) {
                          return CircleAvatar(
                            backgroundImage:
                                Image.asset('assets/image/defualt.image.jpg')
                                    .image,
                            radius: 40,
                            child: img.trim().isNotEmpty
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: MemoryImage(
                                        const Base64Decoder().convert(img)),
                                  )
                                : Container(),
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 50, bottom: 40, top: 20, left: 40),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Box is Emety";
                            } else {
                              return null;
                            }
                          },
                          controller: name,
                          decoration: const InputDecoration(
                              hintText: 'Enter The Name',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 50, bottom: 40, left: 40),
                        child: TextFormField(
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
                              hintText: 'Age', border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 50, bottom: 40, left: 40),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Box is Emety";
                            } else {
                              return null;
                            }
                          },
                          controller: number,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 50, bottom: 40, left: 40),
                        child: TextFormField(
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
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(
                                255, 27, 167, 97), // background
                            // foreground
                          ),
                          onPressed: () {
                            submite(context);
                            _formkey.currentState!.validate();
                            if (valueschaking == true) {
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text("Submite")),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  submite(BuildContext context) {
    final _name = name.text.trim();
    final _age = age.text.trim();
    final _number = number.text.trim();
    final _plce = place.text.trim();
    final imag = img;

    final obj = Model(
        name: _name,
        age: _age,
        phonenumber: _number,
        place: _plce,
        img: imag,
        id: null);

    if (_name.isEmpty ||
        _age.isEmpty ||
        _number.isEmpty ||
        _plce.isEmpty ||
        imag.isEmpty) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green[300],
          content: const Text("successfulled")));
      Addstudent(obj);
      valueschaking = true;

      if (imag.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green[300],
            content: const Text("successfulled")));
      }
    }
  }
}
