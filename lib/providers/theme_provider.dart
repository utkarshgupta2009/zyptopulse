// lib/providers/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_theme.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  static const String _themePreferenceKey = 'theme_mode';

  @override
  ThemeMode build() {
    _loadThemePreference();
    return ThemeMode.dark;
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final storedThemeMode = prefs.getString(_themePreferenceKey);
    
    if (storedThemeMode != null) {
      switch (storedThemeMode) {
        case 'light':
          state = ThemeMode.light;
          break;
        case 'dark':
          state = ThemeMode.dark;
          break;
        default:
          state = ThemeMode.system;
          break;
      }
    }
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    state = themeMode;
    
    switch (themeMode) {
      case ThemeMode.light:
        await prefs.setString(_themePreferenceKey, 'light');
        break;
      case ThemeMode.dark:
        await prefs.setString(_themePreferenceKey, 'dark');
        break;
      case ThemeMode.system:
        await prefs.setString(_themePreferenceKey, 'system');
        break;
    }
  }
}

@riverpod
ThemeData theme(ThemeRef ref, BuildContext context) {
  final themeMode = ref.watch(themeNotifierProvider);
  final platformBrightness = MediaQuery.of(context).platformBrightness;
  
  switch (themeMode) {
    case ThemeMode.light:
      return AppTheme.lightTheme;
    case ThemeMode.dark:
      return AppTheme.darkTheme;
    case ThemeMode.system:
      return platformBrightness == Brightness.light
          ? AppTheme.lightTheme
          : AppTheme.darkTheme;
  }
}