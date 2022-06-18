import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hiveproject/Model/data_models.dart';
import 'package:hiveproject/Class/search.dart';
import 'package:hiveproject/Screens/adding.dart';
import 'package:hiveproject/Screens/details.dart';

import '../Database/db_datas.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    getallDetails();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: StudentList,
        builder: (BuildContext ctx, List<Model> studentList, Widget? child) {
          return Scaffold(
            //===================== App Bar ================//
            appBar: AppBar(
              toolbarHeight: 80,
              title: const Text(
                'Added Profiles',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "BebasNeue-Regular",
                    color: Color.fromARGB(255, 27, 167, 97)),
              ),
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: Searchdetal());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 27, 167, 97),
                    size: 35,
                  ),
                )
              ],
            ),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            body: SafeArea(
              child: ListView.separated(
                //====================== Cards ====================//

                itemBuilder: (ctx, value) {
                  final datas = studentList[value];
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Card(
                      elevation: 3.3,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shadowColor: const Color.fromARGB(0, 11, 11, 11),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: MemoryImage(
                              const Base64Decoder().convert(datas.img!)),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            const AlertDialog(
                              title: Text(
                                "Something Wrong",
                                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            );
                            Deleting(value);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return FullDetails(
                              datas: datas,
                              index: value,
                            );
                          }));
                        },
                        subtitle: const Text("Click Seen Full Details"),
                        title: Text(
                          datas.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'BebasNeue-Regular',
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, value) {
                  return const SizedBox(
                    height: 0,
                    width: 0,
                  );
                },
                itemCount: studentList.length,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 27, 167, 97),
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          img = '';
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return FormHome();
          }));
        },
      ),
    );
  }
}
