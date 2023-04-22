import 'package:floor/floor.dart';
import 'package:floor_example/floor_entity.dart';

@dao
abstract class UserDao {
  
  @Query('SELECT * FROM User')
  Stream<List<User>> retriveAllUsers();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> getUserById(int id);

  @Query('DELETE FROM User WHERE id = :id')
  Future<void> deleteUserById(int id);

  @Query('DELETE FROM User')
  Future<void> deleteAllUsers();

  @insert
  Future<void> insertUser(User user);
  @update
  Future<void> updateUser(User user);
  @delete
  Future<void> deleteUser(User user);
  

}
