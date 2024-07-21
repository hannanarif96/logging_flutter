import 'package:flutter/material.dart';
import 'package:logging_flutter/category/category_page.dart';
import 'package:logging_flutter/category/category_view_model.dart';
import 'package:logging_flutter/settings/settings_page.dart';
import 'package:logging_flutter/settings/settings_view_model.dart';
import 'package:logging_flutter/task/task_page.dart';
import 'package:logging_flutter/task/task_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => SettingsViewModel()..getDarkMode()),
      ],
      child: Consumer<SettingsViewModel>(
        builder: (context, settingsViewModel, child) {
          return MaterialApp(
            title: 'Task Manager Flutter',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: settingsViewModel.darkMode ? Brightness.dark : Brightness.light,
            ),
            home: HomePage(),
            routes: {
              '/tasks': (context) => TaskPage(),
              '/categories': (context) => CategoryPage(),
              '/settings': (context) => SettingsPage(),
            },
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tasks');
              },
              child: Text('Go to Task Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/categories');
              },
              child: Text('Go to Category Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Go to Settings Page'),
            ),
          ],
        ),
      ),
    );
  }
}
