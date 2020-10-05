import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'person.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  Hive
    ..init(appDocumentDirectory.path)
    ..registerAdapter(ObjAdapter())
    ..registerAdapter(AnimalAdapter())
    ..registerAdapter(ResultAdapter());

  var box = await Hive.openBox('testBox');

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

  await box.clear();
  print('cleared');
  box.values.forEach((element) {
    print(element.toString());
  });

  await box.add(obj1);
  await box.add(obj2);
  print('added');
  box.values.forEach((element) {
    print(element.toString());
  });

  var tempPerson = box.getAt(0);
  tempPerson.animals.removeAt(0);
  await box.putAt(0, tempPerson);
  print('animal removed');
  box.values.forEach((element) {
    print(element.toString());
  });

  await box.deleteAt(1);
  print('object removed');
  box.values.forEach((element) {
    print(element.toString());
  });

  var obj = box.getAt(0) as Obj;
  var animal = obj.animals[0];
  animal.result = Result()
  ..res1 = 5
  ..res2 = 4
  ..res3 = 6;
  print('result');
  await box.putAt(0, obj);
  box.values.forEach((element) {
    print(element.toString());
  });


}
