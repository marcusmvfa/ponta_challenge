import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ponta_flutter_test/service/hive_service.dart';
import 'package:ponta_flutter_test/view/home/home_view.dart';
import 'injection.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injection.configureInjection();
  final path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  HiveService().instantiateBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ponta Flutter Test',
      theme: ThemeData(
        primaryColor: const Color(0xffA3C72E),
        primarySwatch: Colors.green,
      ),
      home: const HomeView(),
    );
  }
}
