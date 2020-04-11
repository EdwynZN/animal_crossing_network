import 'package:ac_network/model/database_model.dart';
import 'package:flutter/services.dart';
import 'package:ac_network/generated/l10n.dart';

class DBService{

  Future<void> createDB() async{
    final path = 'assets/databases/villagers';
    String dataVillagerTable = await rootBundle.loadString('$path/villagerTable.json', cache: false);
    String dataLanguage = await rootBundle.loadString('$path/language.json', cache: false);
    String dataVillagerL10n = await rootBundle.loadString('$path/villagerL10n.json', cache: false);

    List<Language> language = await Language.fromJson(dataLanguage);
    List<Villager> villager = await Villager.fromJson(dataVillagerTable);
    List<VillagerL10n> l10n = await VillagerL10n.fromJson(dataVillagerL10n);

    Villager.fromWebUrl('url');

    await Villager().upsertAll(villager);
    await Language().upsertAll(language);
    await VillagerL10n().upsertAll(l10n);
  }

}