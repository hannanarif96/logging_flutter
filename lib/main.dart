import 'package:flutter/material.dart';
import 'package:logging_flutter/brand/brand_page.dart';
import 'package:logging_flutter/brand/brand_view_model.dart';
import 'package:logging_flutter/settings/settings_page.dart';
import 'package:logging_flutter/settings/settings_view_model.dart';
import 'package:logging_flutter/product/product_page.dart';
import 'package:logging_flutter/product/product_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => BrandViewModel()),
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
              '/products': (context) => ProductPage(),
              '/brands': (context) => BrandPage(),
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
                Navigator.pushNamed(context, '/products');
              },
              child: Text('Go to Product Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/brands');
              },
              child: Text('Go to Brand Page'),
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
