import 'package:hive/hive.dart';

part 'hive_creator.g.dart';

@HiveType(typeId: 0)
class Person extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String token;

  @HiveField(3)
  late bool isLogin;

  @HiveField(4)
  late int id;
}
