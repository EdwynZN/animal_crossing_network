import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:ac_network/Model/jaguar_villager.dart';
import 'dart:io';

class Villager{
  int languageId;
  final int amiiboId;
  final int villagerId;
  final String name;
  final String personality;
  final String gender;
  final String specie;
  final String catchPhrase;
  final String song;
  final DateTime birthday;

  Villager({
    this.languageId,
    this.villagerId,
    this.amiiboId,
    this.name,
    this.personality,
    this.gender,
    this.specie,
    this.catchPhrase,
    this.song,
    this.birthday
  });

  factory Villager.fromMap(Map<String, dynamic> villager) => Villager(
    villagerId: villager["id"],
    languageId: villager["languageId"],
    amiiboId: villager["amiiboId"],
    name: villager["name"],
    personality: villager["personality"],
    specie: villager["specie"],
    gender: villager["gender"],
    catchPhrase: villager["catchPhrase"],
    song: villager["song"],
    birthday: villager["birthday"] != null ? DateTime.tryParse(villager["birthday"]) : null,
  );

  Map<String, dynamic> toVillager() => {
    "id": villagerId,
    "amiiboId": amiiboId,
    "birthday": _parseBirthday,
  };

  Map<String, dynamic> toVillagerL10n() => {
    "villagerId": villagerId,
    "languageId": languageId,
    "name": name,
    "personality": personality,
    "specie": specie,
    "gender": gender,
    "catchPhrase": catchPhrase,
    "song": song,
  };

  String get _parseBirthday {
    if(birthday == null) return null;
    StringBuffer date = StringBuffer(birthday.year);
    if(birthday.month <= 9) date.write(0);
    date.write(birthday.month);
    if(birthday.day <= 9) date.write(0);
    date.write(birthday.day);
    return date.toString();
  }

}

main() {
  /*test('convert json Test', () async {
    List<Villager> villagers = <Villager>[];
    final dir = Directory('assets/villagers/villagers');
    final list = dir.listSync();
    bool value = true;

    list.forEach((dir) {

      final file = File.fromUri(dir.uri);
      String data = file.readAsStringSync();
      final Map<String, dynamic> jResult = jsonDecode(data);

      if(jResult["games"]["nh"] != null){
        String date = jResult["birthday"];
        List<String> dateList = date.split('-');
        dateList[0] = dateList[0].length == 1 ? "0${dateList[0]}" : dateList[0];
        dateList[1] = dateList[1].length == 1 ? "0${dateList[1]}" : dateList[1];
        String birthday = "2020${dateList[0]}${dateList[1]}";
        String specie = jResult["species"];
        specie = "${specie[0].toUpperCase()}${specie.substring(1)}";
        String gender = jResult["gender"];
        gender = "${gender[0].toUpperCase()}${gender.substring(1)}";
        String personality = jResult["games"]["nh"]["personality"];
        personality = "${personality[0].toUpperCase()}${personality.substring(1)}";
        final Map<String, dynamic> conversion = {
          //"id": jResult["id"],
          "name": jResult["name"],
          "specie": specie,
          "gender": gender,
          "birthday": birthday,
          "personality": personality,
          "catchPhrase": jResult["games"]["nh"]["phrase"],
          "song": jResult["games"]["nh"]["song"],
        };
        villagers.add(Villager.fromMap(conversion));
      }
    });

    //villagers.forEach((villager) => print(villager.name));

    print(villagers.length);

    Map<String, dynamic> villagerMap = {
      "villager": List<dynamic>.from(villagers.map((x) => x.toMap())),
    };

   *//* final writeFile = File('assets/villagers/test.json');
    writeFile.writeAsStringSync(jsonEncode(villagerMap));*//*
  });*/

  /*test('sort json Test', () async {
    final readFile = File('assets/databases/villagers/villagers_en.json');

    String data = readFile.readAsStringSync();
    final Map<String, dynamic> jResult = jsonDecode(data);

    List<JaguarVillager> villagers = List<JaguarVillager>.from(jResult["villager"].map((x) => JaguarVillager.fromMap(x)));

    villagers.sort((x, y) => x.key.compareTo(y.key));

    Map<String, dynamic> villagerMap = {
      "villager": List<dynamic>.from(villagers.map((x) => x.toMap())),
    };

     final writeFile = File('assets/villagers/test_sort.json');
    writeFile.writeAsStringSync(jsonEncode(villagerMap));
  });*/

  test('key json Test', () async {
    final readFile = File('assets/databases/villagers/villagersen.json');
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
  });

  test('create localzation Test', () async {
    final readFile = File('assets/databases/villagers/villagers_en - copia.json');

    String data = readFile.readAsStringSync();
    //final List<dynamic> jResult = jsonDecode(data);

    final Iterable list = await json.decode(data) as Iterable;

    List<Villager> villagers = list
        .map((villager) => Villager.fromMap(villager as Map<String, dynamic>))
        .toList();

    villagers.forEach((villager) => villager.languageId = 1);

    List<Map<String, dynamic>> mapL10n = villagers
        .map((villager) => villager.toVillagerL10n())
        .toList();

    List<Map<String, dynamic>> mapVillager = villagers
        .map((villager) => villager.toVillager())
        .toList();

    //villagers.sort((x, y) => x.key.compareTo(y.key));

    /*Map<String, dynamic> villagerMap = {
      "villager": List<dynamic>.from(villagers.map((x) => x.toMap())),
    };*/

    final writeFile = File('assets/databases/villagers/villagerL10n.json');
    //writeFile.writeAsStringSync(jsonEncode(mapL10n));
    final writeFile1 = File('assets/databases/villagers/villagerTable.json');
    writeFile1.writeAsStringSync(jsonEncode(mapVillager));
  });
}