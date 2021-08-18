import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'person.dart';

var objectsBox;
var animalsBox;

void main() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ObjAdapter())
    ..registerAdapter(AnimalAdapter())
    ..registerAdapter(ResultAdapter());
  objectsBox = await Hive.openBox<Obj>('objects');
  animalsBox = await Hive.openBox<Animal>('animals');

  WidgetsFlutterBinding.ensureInitialized();

  await clearAndFillDB();
  await removeAnimals();
  await removeObj();
  await addResult();

  printBox('result');
}

Future<void> clearAndFillDB() async {
  await objectsBox.clear();
  await animalsBox.clear();
  printBox('cleared');

  var animal1 = Animal()
    ..name = 'Linda'
    ..id = 22;
  var animal2 = Animal()
    ..name = 'Marc'
    ..id = 21;
  var animal3 = Animal()
    ..name = 'Linda'
    ..id = 25;
  var animal4 = Animal()
    ..name = 'Lindar'
    ..id = 26;

  animalsBox.addAll([animal1, animal2, animal3, animal4]);

  var obj1 = Obj()
    ..name = 'Object1'
    ..id = 22
    ..animals = HiveList(animalsBox);
  obj1.animals.addAll([animal1, animal2]);

  var obj2 = Obj()
    ..name = 'Object2'
    ..id = 22
    ..animals = HiveList(animalsBox);
  obj2.animals.addAll([animal3, animal4]);

  await objectsBox.add(obj1);
  await objectsBox.add(obj2);
  printBox('added');
}

Future<void> removeAnimals() async {
  var animal = objectsBox.getAt(0).animals[0];
  animal.delete();
  print("test1");
  printBox('animal removed');
}

Future<void> removeObj() async {
  //await box.deleteAt(1);
  var obj = objectsBox.getAt(1);
  obj.delete();
  printBox('object removed');
}

Future<void> addResult() async {
  var animal = objectsBox.getAt(0).animals[0];
  animal.result = Result()
    ..res1 = 5
    ..res2 = 4
    ..res3 = 6;
  animal.save();
  printBox('result added');
}

void printBox(String message) {
  print(message);
  objectsBox.values.forEach((element) {
    print(element.toString());
  });
}