import 'package:get/state_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:ponta_flutter_test/model/animal.dart';
import 'package:ponta_flutter_test/model/farm.dart';
import 'package:ponta_flutter_test/service/hive_service.dart';

class FarmController {
  final hiveService = GetIt.instance<HiveService>();

  RxList<Farm> farmList = <Farm>[].obs;

  Farm? farmSelected;

  Future fetchFarms() async {
    final result = await hiveService.fetchFarms();
    farmList.value = result;
  }

  Future addFarm(String name) async {
    final newFarm = Farm(id: 0, name: name);
    await hiveService.addFarm(newFarm);
    farmList.add(newFarm);
  }

  Future deleteFarm(int id) async {
    await hiveService.deleteFarm(id);
    await fetchFarms();
  }

  createFarm(String farmName) {
    var newFarm = Farm(id: 321, name: farmName);
    farmList.add(newFarm);
  }
}
