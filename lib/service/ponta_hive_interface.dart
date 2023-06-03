import 'package:hive/hive.dart';
import 'package:ponta_flutter_test/model/i_generic_model.dart';

abstract class PontaHiveInterface {
  Future<List<IGenericModel>> fetchData<IGenericModel>();
  Future<void> saveAll<T>(List<T> items);
  Future<void> add<T>(T item);
  Future<void> delete<T>(int id);
}
