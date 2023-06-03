// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'package:ponta_flutter_test/model/animal.dart';
import 'package:ponta_flutter_test/service/hive_service.dart';

class AnimalController {
  RxList<Animal> animalList = <Animal>[].obs;
  int farmId = 0;

  final hiveService = GetIt.instance<HiveService>();

  AnimalController({
    required this.farmId,
  }) {
    print("########## farm Id : $farmId #######");
  }
  fetchAnimals() async {
    final result = await hiveService.fetchAnimals(farmId: farmId);
    animalList.value = result;
  }

  Future addAnimal(String tag) async {
    final newAnimal = Animal(id: 0, farmId: farmId, tagId: tag);
    await hiveService.addAnimal(newAnimal);
    animalList.add(newAnimal);
  }

  Future deleteAnimal(int id) async {
    await hiveService.deleteAnimal(id);
    await fetchAnimals();
  }

  Future saveAllAnimal() async {
    await hiveService.saveAllAnimals(animalList);
  }
}
