// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor_example/floor_dao.dart';
import 'package:flutter/material.dart';

import 'package:floor_example/home_page.dart';

import 'floor_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserDatabase? database = await $FloorUserDatabase.databaseBuilder('app_database.db').build();
  runApp(MyApp(userDatabase: database));
}

class MyApp extends StatelessWidget {
  UserDatabase? userDatabase;
  MyApp({
    Key? key,
    this.userDatabase,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final UserDao userDao =  userDatabase!.userDao;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      
      home: HomePage(userDao: userDao),
    );
  }
}

