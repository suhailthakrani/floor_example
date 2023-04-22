import 'dart:async';
import 'package:floor/floor.dart';
import 'package:floor_example/floor_dao.dart';
import 'package:floor_example/floor_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_database.g.dart';

@Database(version: 1, entities: [User])
abstract class UserDatabase extends FloorDatabase {
  UserDao get userDao;
}