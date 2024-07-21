import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'settings_view_model.dart';
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Consumer<SettingsViewModel>(
          builder: (context, settingsViewModel, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dark Mode: ${settingsViewModel.darkMode ? "On" : "Off"}'),
                Switch(
                  value: settingsViewModel.darkMode,
                  onChanged: (value) async {
                    await settingsViewModel.setDarkMode(value);
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    await settingsViewModel.getDarkMode();
                  },
                  child: Text('Refresh Dark Mode'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}