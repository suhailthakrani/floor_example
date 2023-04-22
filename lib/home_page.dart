// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:faker/faker.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:floor_example/floor_dao.dart';
import 'package:floor_example/floor_database.dart';
import 'package:floor_example/floor_entity.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  final UserDao? userDao;
  const HomePage({
    Key? key,
    this.userDao,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey<ScaffoldState>();
  Stream<List<User>>? users;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    final faker = Faker();
    UserDao userDao;

    users = widget.userDao!.retriveAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              final user = User(
                  name: Faker().person.name(),
                  age: Faker().person.random.integer(25),
                  country: Faker().address.country(),
                  email: Faker().internet.email());
              widget.userDao!.insertUser(user);
            },
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                widget.userDao!.deleteAllUsers();
              });
            },
          )
        ],
      ),
      body: StreamBuilder<List<User>>(
        stream: users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data ?? [];
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                      motion: IconButton(
                        // label: "Delete",
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () async {
                          await widget.userDao!.deleteUser(users[index]);
                          setState(() {});
                        },
                      ),
                      children: [
                        SlidableAction(
                          // label: 'Update',
                          backgroundColor: Colors.deepPurple,
                          icon: Icons.update,
                          onPressed: (context) {
                            final user = User(
                                name: Faker().person.name(),
                                age: Faker().person.random.integer(25),
                                country: Faker().address.country(),
                                email: Faker().internet.email());
                            widget.userDao!.updateUser(user);
                            setState(() {});
                          },
                        ),
                        SlidableAction(
                          // label: "Delete",
                          icon: Icons.delete,
                          backgroundColor: Colors.red,
                          onPressed: (context) {
                            widget.userDao!.deleteUser(users[index]);
                            setState(() {});
                          },
                        )
                      ]),
                  child: ListTile(
                    title:
                        Text("${users[index].name}  Age: ${users[index].age}"),
                    subtitle: Text(users[index].country),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
