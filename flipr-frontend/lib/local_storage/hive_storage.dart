import 'package:flipr/local_storage/hive_creator.dart';
import 'package:flipr/main.dart';

class HiveStorage {
  static Future<void> addPerson(String? name, String? email, String? token,
      int? id, bool? isLogin) async {
    final person = Person()
      ..name = name ?? ""
      ..email = email ?? ""
      ..token = token ?? ""
      ..id = id ?? 0
      ..isLogin = isLogin ?? false;
    box.put("cache", person);
  }

  static Future<Person?> getDetails() async {
    final hiveDB = await box.get("cache");
    if (hiveDB != null) {
      return hiveDB;
    } else {
      return null;
    }
  }

  static void deleteCache(Person person) {
    person.delete();
  }

  static setLogOut() {
    box.delete("cache");
  }
}
