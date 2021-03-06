import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hiveproject/Model/data_models.dart';
import 'package:hiveproject/Provider/student_list.dart';
import 'package:hiveproject/Screens/home.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  if (!Hive.isAdapterRegistered(ModelAdapter().typeId)) {
    Hive.registerAdapter(ModelAdapter());
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => Hiveservice(),
      ),
    ],
    child: Myapp(),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: const Color.fromARGB(156, 255, 255, 255),
      ),
      home: const Home(),
    );
  }
}
