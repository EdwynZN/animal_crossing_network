import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:ac_network/Model/jaguar_villager.dart';
import 'dart:io';

main() {
  test('convert image file name Test', () async {
    final dir = Directory('assets/images/imagesVillagers');
    final list = dir.listSync();

    final readFile = File('assets/databases/villagers/villagers_en.json');
    String data = readFile.readAsStringSync();
    final Map<String, dynamic> jResult = jsonDecode(data);

    List<JaguarVillager> villagers = List<JaguarVillager>.from(jResult["villager"].map((x) => JaguarVillager.fromMap(x)));

    villagers.forEach((villager){
      final fileEntity = list.firstWhere((val) => val.path.replaceAll('_', ' ').contains(villager.name), orElse: () => null);
      //final fileEntity = list.firstWhere((val) => val.path.contains(villager.name), orElse: () => null);
      fileEntity?.renameSync('assets/images/villagers/${villager.key}.png');
    });

    /*list.forEach((dir) {

      //dir.uri.toString().replaceAll('_', ' ');

      //if(dir.uri.toString().contains('_'))
      print('${dir.uri}');

    });*/

  });

  /*test('key json Test', () async {
    final readFile = File('assets/databases/villagers/villagers_en.json');
    int key = 1;

    String data = readFile.readAsStringSync();
    final Map<String, dynamic> jResult = jsonDecode(data);

    List<JaguarVillager> villagers = List<JaguarVillager>.from(jResult["villager"].map((x) => JaguarVillager.fromMap(x)));

    villagers.forEach((villager) => villager.key = key++);

    //villagers.sort((x, y) => x.key.compareTo(y.key));

    print(key);

    Map<String, dynamic> villagerMap = {
      "villager": List<dynamic>.from(villagers.map((x) => x.toMap())),
    };

    final writeFile = File('assets/databases/villagers/test_sort.json');
    writeFile.writeAsStringSync(jsonEncode(villagerMap));
  });*/
}