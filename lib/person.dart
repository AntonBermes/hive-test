import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId : 0)
class Obj extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int id;

  @HiveField(2)
  List<Animal> animals;

  @override
  String toString() {
    return '$name: $id, animals = $animals';
  }
}

@HiveType(typeId : 1)
class Animal extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int id;

  @HiveField(2)
  Result result;

  @override
  String toString() {
    return '$name: $id, result: $result';
  }
}

@HiveType(typeId : 2)
class Result {
  @HiveField(0)
  int res1;
  @HiveField(1)
  int res2;
  @HiveField(2)
  int res3;

  @override
  String toString() {
    return '$res1, $res2, $res3';
  }
}