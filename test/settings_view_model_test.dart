import 'package:flutter_test/flutter_test.dart';
import 'package:logging_flutter/settings/settings_view_model.dart';
import 'package:flutter/services.dart';
void main() {
  const MethodChannel channel = MethodChannel('com.example.settings');
  final SettingsViewModel viewModel = SettingsViewModel();

  TestWidgetsFlutterBinding.ensureInitialized();

  group('SettingsViewModel Test', () {
    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        switch (methodCall.method) {
          case 'getDarkMode':
            return true; // Mocked response
          case 'setDarkMode':
            return null;
          default:
            return null;
        }
      });
    });

    tearDown(() {
      channel.setMockMethodCallHandler(null);
    });

    test('getDarkMode', () async {
      await viewModel.getDarkMode();
      expect(viewModel.darkMode, true);
    });

    test('setDarkMode', () async {
      await viewModel.setDarkMode(false);
      expect(viewModel.darkMode, false);
    });
  });
}