import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'ru': {
      'loading': 'Загрузка...',
      'login_title': 'Login',
      'welcome': 'С возвращением! Пожалуйста, войдите, чтобы продолжить.',
      'user_id': 'User ID',
      'password': 'Password',
      'remember': 'Remember Me',
      'forgot': 'Забыли пароль?',
      'login_btn': 'Login',
      'or': 'ИЛИ ПРОДОЛЖИТЬ ЧЕРЕЗ',
      'err_user': 'Введите User ID',
      'err_pass': 'Введите пароль',
      'success': 'Успешный вход в систему!',
      'dev': 'Вход через соцсеть в разработке',
    },
    'en': {
      'loading': 'Loading...',
      'login_title': 'Login',
      'welcome': 'Welcome Back! Please login to continue.',
      'user_id': 'User ID',
      'password': 'Password',
      'remember': 'Remember Me',
      'forgot': 'Forgot Password?',
      'login_btn': 'Login',
      'or': 'OR CONTINUE WITH',
      'err_user': 'Enter User ID',
      'err_pass': 'Enter password',
      'success': 'Login successful!',
      'dev': 'Social login under development',
    },
    'ky': {
      'loading': 'Жүктөлүүдө...',
      'login_title': 'Кирүү',
      'welcome': 'Кош келдиңиз! Улантуу үчүн кирүү.',
      'user_id': 'Колдонуучу ID',
      'password': 'Сырсөз',
      'remember': 'Мени эстеп калуу',
      'forgot': 'Сырсөздү унуттуңузбу?',
      'login_btn': 'Кирүү',
      'or': 'ЖЕ БУЛ МЕНЕН УЛАНТУУ',
      'err_user': 'ID жазыңыз',
      'err_pass': 'Сырсөздү жазыңыз',
      'success': 'Ийгиликтүү кирдиңиз!',
      'dev': 'Соцтармак аркылуу кирүү иштеп чыгууда',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}
