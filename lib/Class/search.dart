import 'package:flutter/material.dart';
import 'package:hiveproject/Model/data_models.dart';
import 'package:hiveproject/Provider/student_list.dart';
import 'package:hiveproject/Screens/details.dart';
import 'package:provider/provider.dart';

class Searchdetal extends SearchDelegate {
  Model? data;

  Searchdetal({this.data});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = ' ';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer(
        builder: (BuildContext ctx, Hiveservice studentList, Widget? child) {
      return ListView.separated(
        itemBuilder: (ctx, index) {
          final datas = studentList.StudentList[index];
          if (query.toLowerCase() == datas.name.toLowerCase()) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        (MaterialPageRoute(builder: (ctx) {
                          return FullDetails(datas: datas, index: index);
                        })),
                        (route) => true);
                  },
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
          } else {
            return Container();
          }
        },
        separatorBuilder: (ctx, value) {
          return const SizedBox(
            width: 0,
            height: 0,
          );
        },
        itemCount: studentList.StudentList.length,
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
        builder: (BuildContext ctx, Hiveservice studentList, Widget? child) {
      return ListView.separated(
        itemBuilder: (ctx, index) {
          final datas = studentList.StudentList[index];
          if (query == datas.name[0].toLowerCase()) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: ListTile(
                  leading: const Icon(Icons.person),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        (MaterialPageRoute(builder: (ctx) {
                          return FullDetails(datas: datas, index: index);
                        })),
                        (route) => false);
                  },
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
          } else {
            return Container();
          }
        },
        separatorBuilder: (ctx, value) {
          return const SizedBox(
            width: 0,
            height: 0,
          );
        },
        itemCount: studentList.StudentList.length,
      );
    });
  }
}
