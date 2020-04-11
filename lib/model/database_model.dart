import 'package:sqfentity/sqfentity.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'database_model.g.dart';

const tableVillager = SqfEntityTable(
  tableName: 'villager',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_unique,
  useSoftDeleting: false,
  fields: [
    SqfEntityField('amiiboId', DbType.integer),
    SqfEntityField('birthday', DbType.date)
  ]
);

const tableVillagerResident = SqfEntityTable(
  tableName: 'resident',
  useSoftDeleting: false,
  relationType: RelationType.ONE_TO_ONE,
  fields: [
    SqfEntityFieldRelationship(
        fieldName: 'villagerId',
        deleteRule: DeleteRule.CASCADE,
        parentTable: tableVillager,
        relationType: RelationType.ONE_TO_ONE,
        isPrimaryKeyField: true
    ),
    SqfEntityField('favorite', DbType.bool, defaultValue: false),
    SqfEntityField('resident', DbType.bool, defaultValue: false),
  ]
);

const tableVillagerLocalization = SqfEntityTable(
  tableName: 'villager_l10n',
  modelName: 'VillagerL10n',
  useSoftDeleting: false,
  fields: [
    SqfEntityFieldRelationship(
        fieldName: 'villagerId',
        parentTable: tableVillager,
        relationType: RelationType.ONE_TO_MANY,
        deleteRule: DeleteRule.CASCADE,
        isPrimaryKeyField: true
    ),
    SqfEntityFieldRelationship(
      fieldName: 'languageId',
      parentTable: tableLanguage,
      relationType: RelationType.ONE_TO_MANY,
      deleteRule: DeleteRule.CASCADE,
      isPrimaryKeyField: true
    ),
    SqfEntityField('name', DbType.text),
    SqfEntityField('personality', DbType.text,),
    SqfEntityField('gender', DbType.text,),
    SqfEntityField('specie', DbType.text,),
    SqfEntityField('catchPhrase', DbType.text,),
    SqfEntityField('song', DbType.text,),
  ]
);

const tableLanguage = SqfEntityTable(
  tableName: 'language',
  modelName: 'Language',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_unique,
  useSoftDeleting: false,
  fields: [
    SqfEntityField('name', DbType.text, ),
  ]
);

@SqfEntityBuilder(myDbModel)
const myDbModel = SqfEntityModel(
    modelName: 'ACDatabase',
    databaseName: 'ACNetwork.db',
    databaseTables: [tableVillager, tableVillagerResident, tableVillagerLocalization, tableLanguage],
    //formTables: [tableVillager, tableVillagerResident, tableVillagerLocalization, tableLanguage],
    //bundledDatabasePath: 'assets/databases/villagers/unknown_name.sqlite' //         'assets/sample.db'
  // This value is optional. When bundledDatabasePath is empty then
  // EntityBase creats a new database when initializing the database
);

/* STEP 3: That's All..
--> Go Terminal Window and run command below
    flutter pub run build_runner build --delete-conflicting-outputs
  Note: After running the command Please check lib/model/model.g.dart and lib/model/model.g.view.dart (If formTables parameter is defined in the model)
  Enjoy.. Huseyin TOKPINAR
*/