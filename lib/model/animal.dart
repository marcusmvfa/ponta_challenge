import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:ponta_flutter_test/model/i_generic_model.dart';
part 'animal.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@HiveType(typeId: 2)
class Animal extends HiveObject {
  @HiveField(0, defaultValue: 0)
  int id;
  @HiveField(1)
  int farmId;
  @HiveField(2)
  String tagId;

  Animal({
    required this.id,
    required this.farmId,
    required this.tagId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'farmId': farmId,
      'tagId': tagId,
    };
  }

  factory Animal.fromMap(Map<dynamic, dynamic> map) {
    return Animal(
      id: map['id'] as int,
      farmId: map['farmId'] as int,
      tagId: map['tagId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Animal.fromJson(String source) => Animal.fromMap(json.decode(source) as Map<String, dynamic>);
}
