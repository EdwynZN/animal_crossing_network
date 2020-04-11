import 'package:ac_network/Model/task.dart';
import 'package:ac_network/Provider/theme_provider.dart';
import 'package:ac_network/Widget/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:ac_network/Util/route_transitions.dart';
import 'package:ac_network/Util/theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ac_network/Service/database_service.dart';
import 'package:ac_network/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ac_network/Screen/home.dart';

Future<void> _initHive() async {
  final appDocumentDir  = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.openBox<Task>('Task');
}

Future<void> _initSchedule() async{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  var initializationSettingsAndroid = AndroidInitializationSettings('ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings(
      onDidReceiveLocalNotification: null);
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    onSelectNotification: (payload) {
      return null;
    });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final service = DBService();
  await _initHive();
  //await service.createDB();
  //await _initSchedule();
  runApp(AnimalCrossingNetwork());
}

class AnimalCrossingNetwork extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ValueListenableProvider<Box<Task>>.value(
          value: Hive.box<Task>('Task').listenable(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        Consumer<ThemeProvider>(
          builder: (ctx, theme, _){
            return MaterialApp(
              localizationsDelegates: [S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              themeMode: theme.mode,
              theme: Themes.animalCrossingTheme,
              darkTheme: Themes.dark,
              onGenerateRoute: Routes.getRoute,
            );
          },
        )
      ],
      /*child: MaterialApp(
        localizationsDelegates: [S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: Themes.animalCrossingTheme,
        darkTheme: Themes.dark,
        onGenerateRoute: Routes.getRoute,
      ),*/
    );
  }
}

