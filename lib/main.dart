import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moovup_program_test/Views/MapView/MapViewModel.dart';
import 'package:provider/provider.dart';
import 'package:moovup_program_test/Views/MapView/MapView.dart';
import 'package:moovup_program_test/Views/PeopleList/PeopleListView.dart';
import 'Common/Config/ColorGuide.dart';
import 'Common/Config/FontGuide.dart';
import 'Models/PeopleListModel.dart';
import 'Views/PeopleList/PeopleListViewModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PeopleListModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {

  Locale _locale = const Locale('en');

  void setLocale(Locale value) {
    setState(() {
      if (kDebugMode) {
        print('Set language to $value');
      }
      _locale = value;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mooveup Test',
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Moovup Test Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);


  @override
  void initState() {
    super.initState();
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: ColorGuide.mainTheme,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          AppLocalizations.of(context)!.moovup_test_page,
          style: FontGuide.navigationBarTitle,
        ),
        actions: [IconButton(onPressed: () {
          if (MyApp.of(context)!._locale.languageCode == "en") {
            MyApp.of(context)?.setLocale(const Locale('zh', 'Hant'));
          } else {
            MyApp.of(context)?.setLocale(const Locale('en', 'US'));
          }
        }, icon: Icon(Icons.language), color: Colors.white,)],
      ),
      body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            PeopleListView(peopleListViewModel: PeopleListViewModel()),
            MapView(mapViewModel: MapViewModel()),
          ]),
      bottomNavigationBar: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              text: AppLocalizations.of(context)!.people_list,
              icon: Icon(
                key: const Key('People List'),
                Icons.list,
                color: _tabController.index == 0
                    ? ColorGuide.mainTheme
                    : Colors.grey,
              ),
            ),
            Tab(
              text: AppLocalizations.of(context)!.people_map,
              icon: Icon(
                key: const Key('People Map'),
                Icons.map,
                color: _tabController.index == 1
                    ? ColorGuide.mainTheme
                    : Colors.grey,
              ),
            ),
          ]),
    );
  }
}
