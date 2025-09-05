import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageNotifier extends ChangeNotifier {
  static const String _languageKey = 'selected_language';
  Locale _currentLocale = const Locale('pt', 'BR');
  
  Locale get currentLocale => _currentLocale;
  
  bool get isPortuguese => _currentLocale.languageCode == 'pt';
  bool get isEnglish => _currentLocale.languageCode == 'en';
  
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey);
    
    if (languageCode != null) {
      switch (languageCode) {
        case 'pt':
          _currentLocale = const Locale('pt', 'BR');
          break;
        case 'en':
          _currentLocale = const Locale('en', 'US');
          break;
        default:
          _currentLocale = const Locale('pt', 'BR');
      }
    }
    notifyListeners();
  }
  
  Future<void> changeLanguage(Locale locale) async {
    _currentLocale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, locale.languageCode);
    notifyListeners();
  }
}
