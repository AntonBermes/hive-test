import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'person.dart';

var box;

void main() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(ObjAdapter())
    ..registerAdapter(AnimalAdapter())
    ..registerAdapter(ResultAdapter());
  box = await Hive.openBox<Obj>('testBox');

  WidgetsFlutterBinding.ensureInitialized();

  await clearAndFillDB();
  await removeAnimal();
  await removeObj();
  await addResult();

  printBox('result');
  await box.close();
}

Future<void> clearAndFillDB() async {
  await box.clear();
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

  var obj1 = Obj()
    ..name = 'Object1'
    ..id = 22
    ..animals = [animal1, animal2, animal3];
  var obj2 = Obj()
    ..name = 'Object2'
    ..id = 22
    ..animals = [animal1, animal2, animal3];

  await box.add(obj1);
  await box.add(obj2);
  printBox('added');
}

Future<void> removeAnimal() async {
  var obj = box.getAt(0);
  obj.animals.removeAt(0);
  //await box.putAt(0, obj);
  obj.save();
  printBox('animal removed');
}

Future<void> removeObj() async {
  //await box.deleteAt(1);
  var obj = box.getAt(1);
  obj.delete();
  printBox('object removed');
}

Future<void> addResult() async {
  var obj = box.getAt(0) as Obj;
  var animal = obj.animals[0];
  animal.result = Result()
    ..res1 = 5
    ..res2 = 4
    ..res3 = 6;
  obj.save();
  printBox('result added');
}

void printBox(String message) {
  print(message);
  box.values.forEach((element) {
    print(element.toString());
  });
}