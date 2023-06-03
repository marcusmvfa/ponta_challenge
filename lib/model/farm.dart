import 'dart:convert';

import 'package:hive/hive.dart';
part 'farm.g.dart';

@HiveType(typeId: 0)
class Farm extends HiveObject {
  @HiveField(0, defaultValue: 0)
  int id;
  @HiveField(1)
  String name;

  Farm({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Farm.fromMap(Map<String, dynamic> map) {
    return Farm(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Farm.fromJson(String source) => Farm.fromMap(json.decode(source) as Map<String, dynamic>);
}
