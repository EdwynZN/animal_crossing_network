import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:ac_network/Model/database_model.dart';
import 'dart:io';

main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('key json Test', () async {
    final readFile = File('assets/databases/villagers/villagers_en.json');

    String data = readFile.readAsStringSync();
    final Map<String, dynamic> jResult = jsonDecode(data);
    if(jResult == null) {
      print('empty file');
      return;
    }

    List<VillagerL10n> localization = await VillagerL10n.fromMapList(jResult['villager']);
    List<Villager> villager = await Villager.fromMapList(jResult['villager']);

    for(int i = 0; i <= villager.length; i++){
      print('${localization[i].name} : ${villager[i].birthday}');
    }

    localization.forEach((x) => print(x.name));

  });
}