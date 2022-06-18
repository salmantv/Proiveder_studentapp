import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hiveproject/Model/data_models.dart';
import 'package:hiveproject/Screens/editing.dart';
import 'package:hiveproject/Screens/adding.dart';

// ignore: must_be_immutable
class FullDetails extends StatelessWidget {
  Model datas;
  int index;

  FullDetails({Key? key, required this.datas, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 27, 167, 97),
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (tx) {
              return FormHome();
            }));
          }),

      // ===================  AppBar   =====================//
       appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                  return Edit(datas: datas, index2: index);
                }));
              },
              icon: const Icon(
                Icons.edit,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 30,
              )),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 27, 167, 97),
        ),
      ),

      //==================== The Full Details =========================//
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top:20, left: 30, right: 30, bottom: 60),
          child: Card(
            color: const Color.fromARGB(255, 245, 242, 242),
            elevation: 3.5,
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //========================= Image ============================//
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        MemoryImage(const Base64Decoder().convert(datas.img!)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text("Name  :   ${datas.name}",
                        style: const TextStyle(
                          fontFamily: "BebasNeue-Regular",
                          fontSize: 30,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text("Age :    ${datas.age}",
                        style: const TextStyle(
                          fontFamily: "BebasNeue-Regular",
                          fontSize: 30,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text("Number :  ${datas.phonenumber}  ",
                        style: const TextStyle(
                          fontFamily: "BebasNeue-Regular",
                          fontSize: 30,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text("Place :  ${datas.place}",
                        style: const TextStyle(
                          fontFamily: "BebasNeue-Regular",
                          fontSize: 30,
                        )),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            const Color.fromARGB(255, 28, 205, 116), // background
                        // foreground
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Back")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
