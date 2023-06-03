import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ponta_flutter_test/controller/animal_controller.dart';
import 'package:ponta_flutter_test/controller/farm_controller.dart';
import 'package:ponta_flutter_test/service/hive_service.dart';

final GetIt getIt = GetIt.instance;
void configureInjection() async {
  getIt.registerLazySingleton<FarmController>(() => FarmController());
  getIt.registerLazySingleton<AnimalController>(() {
    return AnimalController(farmId: Get.arguments['farmId']);
  });
  getIt.registerSingleton<HiveService>(HiveService());
}
