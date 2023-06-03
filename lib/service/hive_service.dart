import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ponta_flutter_test/model/animal.dart';
import 'package:ponta_flutter_test/model/farm.dart';
import 'package:ponta_flutter_test/service/ponta_hive_interface.dart';

class HiveService implements PontaHiveInterface {
  static final HiveService _singleton = HiveService._internal();
  late BoxCollection collection;

  factory HiveService() {
    return _singleton;
  }

  HiveService._internal();

  instantiateBoxes() async {
    final path = await getApplicationDocumentsDirectory();
    registerAdapters();
    collection = await BoxCollection.open(
        'pontaBoxes', // Name of your database
        {
          'farms',
          'animals',
        },
        path: path.path);
  }

  registerAdapters() {
    Hive.registerAdapter<Farm>(FarmAdapter());
    Hive.registerAdapter<Animal>(AnimalAdapter());
  }

  Future<List<Animal>> fetchAnimals({required int farmId}) async {
    final box = await Hive.openBox<Animal>('animals');
    final listAniamls = box.values.where((animal) => animal.farmId == farmId).toList();
    return listAniamls;
  }

  Future<void> saveAllAnimals(List<Animal> listAnimal) async {
    await Future.forEach<Animal>(
      listAnimal,
      (animal) async => await animal.save(),
    );
  }

  Future<void> addAnimal(Animal animal) async {
    final box = await Hive.openBox<Animal>("animals");
    await box.add(animal);
    animal.id = animal.key;
    await animal.save();
  }

  Future<void> deleteAnimal(int id) async {
    final box = await Hive.openBox<Animal>('animals');
    await box.delete(id);
  }

  Future<List<Farm>> fetchFarms() async {
    final box = await Hive.openBox<Farm>('farms');
    final listfarms = box.values.toList();
    return listfarms;
  }

  Future<void> saveAllfarms(List<Farm> listFarms) async {
    await Future.forEach<Farm>(
      listFarms,
      (farm) async => await farm.save(),
    );
  }

  Future<void> addFarm(Farm farm) async {
    final box = await Hive.openBox<Farm>("farms");
    await box.add(farm);
    farm.id = farm.key;
    await farm.save();
  }

  Future<void> deleteFarm(int id) async {
    final box = await Hive.openBox<Farm>('farms');
    await box.delete(id);
  }

  @override
  Future<void> add<T>(T item) async {
    final boxType = T is Animal ? "animals" : "farms";
    final box = await Hive.openBox<T>(boxType);
    await box.add(item);
    // item!.id = item.key;
    // await item.save();
  }

  @override
  Future<void> delete<T>(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<T>> fetchData<T>() {
    // TODO: implement fetchData
    throw UnimplementedError();
  }

  @override
  Future<void> saveAll<T>(List<T> items) {
    // TODO: implement saveAll
    throw UnimplementedError();
  }
}
