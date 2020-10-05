// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObjAdapter extends TypeAdapter<Obj> {
  @override
  final int typeId = 0;

  @override
  Obj read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Obj()
      ..name = fields[0] as String
      ..id = fields[1] as int
      ..animals = (fields[2] as List)?.cast<Animal>();
  }

  @override
  void write(BinaryWriter writer, Obj obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.animals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnimalAdapter extends TypeAdapter<Animal> {
  @override
  final int typeId = 1;

  @override
  Animal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Animal()
      ..name = fields[0] as String
      ..id = fields[1] as int
      ..result = fields[2] as Result;
  }

  @override
  void write(BinaryWriter writer, Animal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.result);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ResultAdapter extends TypeAdapter<Result> {
  @override
  final int typeId = 2;

  @override
  Result read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Result()
      ..res1 = fields[0] as int
      ..res2 = fields[1] as int
      ..res3 = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, Result obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.res1)
      ..writeByte(1)
      ..write(obj.res2)
      ..writeByte(2)
      ..write(obj.res3);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
