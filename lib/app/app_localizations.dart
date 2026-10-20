import 'package:flutter/material.dart';
class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'ru': {
      // Сплаш
      'loading': 'Загрузка...',
      'wait': 'Пожалуйста, подождите 10 сек',
      // Вход (Login)
      'login_title': 'Вход',
      'welcome': 'С возвращением! Пожалуйста, войдите, чтобы продолжить.',
      'user_id': 'Идентификатор (User ID)',
      'password': 'Пароль',
      'remember': 'Запомнить меня',
      'forgot': 'Забыли пароль?',
      'login_btn': 'Войти',
      'or': 'ИЛИ ПРОДОЛЖИТЬ ЧЕРЕЗ',
      'no_account': 'Нет аккаунта?',
      'sign_up_link': 'Регистрация',
      'err_user': 'Введите User ID',
      'err_pass': 'Введите пароль',
      'success_login': 'Успешный вход в систему!',
      'dev': 'Функция в разработке',
      // Регистрация (Sign Up)
      'signup_title': 'Регистрация',
      'signup_welcome': 'Создайте новый аккаунт, чтобы начать!',
      'enter_name': 'Введите ваше имя',
      'enter_email': 'Введите ваш Email',
      'create_password': 'Создайте пароль',
      'signup_btn': 'Зарегистрироваться',
      'already_have_acc': 'Уже есть аккаунт?',
      'login_link': 'Войти',
      'err_name': 'Введите имя',
      'err_email': 'Введите корректный Email',
      'success_signup': 'Регистрация прошла успешно!',
    },
    'en': {
      // Splash
      'loading': 'Loading...',
      'wait': 'Please wait 10 sec',
      // Login
      'login_title': 'Login',
      'welcome': 'Welcome Back! Please login to continue.',
      'user_id': 'User ID',
      'password': 'Password',
      'remember': 'Remember Me',
      'forgot': 'Forgot Password?',
      'login_btn': 'Login',
      'or': 'OR CONTINUE WITH',
      'no_account': "Don't have an account?",
      'sign_up_link': 'Sign Up',
      'err_user': 'Enter User ID',
      'err_pass': 'Enter password',
      'success_login': 'Login successful!',
      'dev': 'Feature under development',
      // Sign Up
      'signup_title': 'Sign Up',
      'signup_welcome': 'Create a new account to get started!',
      'enter_name': 'Enter your name',
      'enter_email': 'Enter your email',
      'create_password': 'Create a password',
      'signup_btn': 'Sign Up',
      'already_have_acc': 'Already have an account?',
      'login_link': 'Log In',
      'err_name': 'Enter your name',
      'err_email': 'Enter valid Email',
      'success_signup': 'Registration successful!',
    },
    'ky': {
      // Splash
      'loading': 'Жүктөлүүдө...',
      'wait': 'Сураныч, 10 секунд күтүңүз',
      // Login
      'login_title': 'Кирүү',
      'welcome': 'Кош келдиңиз! Улантуу үчүн тутумга кириңиз.',
      'user_id': 'Колдонуучу ID',
      'password': 'Сырсөз',
      'remember': 'Мени эстеп калуу',
      'forgot': 'Сырсөздү унуттуңузбу?',
      'login_btn': 'Кирүү',
      'or': 'ЖЕ БУЛ МЕНЕН УЛАНТУУ',
      'no_account': 'Аккаунтуңуз жокпу?',
      'sign_up_link': 'Катталуу',
      'err_user': 'ID жазыңыз',
      'err_pass': 'Сырсөздү жазыңыз',
      'success_login': 'Ийгиликтүү кирдиңиз!',
      'dev': 'Иштеп чыгууда',
      // Sign Up
      'signup_title': 'Катталуу',
      'signup_welcome': 'Баштоо үчүн жаңы аккаунт түзүңүз!',
      'enter_name': 'Атыңызды киргизиңиз',
      'enter_email': 'Электрондук почтаңызды киргизиңиз',
      'create_password': 'Сырсөз түзүңүз',
      'signup_btn': 'Катталуу',
      'already_have_acc': 'Аккаунтуңуз барбы?',
      'login_link': 'Кирүү',
      'err_name': 'Атыңызды жазыңыз',
      'err_email': 'Почтаны туура жазыңыз',
      'success_signup': 'Катталуу ийгиликтүү өттү!',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }
}