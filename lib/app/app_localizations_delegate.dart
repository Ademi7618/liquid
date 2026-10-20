import 'package:flutter/material.dart';
import 'package:liquid/app/app_localizations.dart';
import 'package:liquid/app/liguid_glass_app.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ru', 'en', 'ky'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}


Widget buildLanguageDropdown() {
  return Padding(
    padding: const EdgeInsets.only(right: 20, top: 8),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.8)),
      ),
      child: ValueListenableBuilder<Locale>(
        valueListenable: appLocale,
        builder: (context, currentLocale, child) {
          return DropdownButton<String>(
            value: currentLocale.languageCode,
            underline: const SizedBox(),
            icon: const Icon(Icons.language, color: Color(0xFF0D3B66)),
            items: const [
              DropdownMenuItem(value: 'ru', child: Text('РУС', style: TextStyle(fontWeight: FontWeight.bold))),
              DropdownMenuItem(value: 'en', child: Text('ENG', style: TextStyle(fontWeight: FontWeight.bold))),
              DropdownMenuItem(value: 'ky', child: Text('КЫР', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            onChanged: (String? newLangCode) {
              if (newLangCode != null) {
                appLocale.value = Locale(newLangCode);
              }
            },
          );
        },
      ),
    ),
  );
}