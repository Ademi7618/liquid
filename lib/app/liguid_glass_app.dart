import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:liquid/app/app_localizations_delegate.dart';
import 'package:liquid/screen/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final ValueNotifier<Locale> appLocale = ValueNotifier<Locale>(const Locale('ru'));

class LiquidGlassApp extends StatelessWidget {
  const LiquidGlassApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: appLocale,
      builder: (context, currentLocale, child) {
        return MaterialApp(
          title: 'Liquid Glass App',
          debugShowCheckedModeBanner: false,
          locale: currentLocale,
          supportedLocales: const [
            Locale('ru'), // Русский
            Locale('en'), // Английский
            Locale('ky'), // Кыргызский
          ],
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFD4F1F9),
            fontFamily: 'sans-serif',
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}