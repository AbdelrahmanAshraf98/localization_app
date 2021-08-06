import 'package:flutter/material.dart';

class L10n {

  static final all = [
    const Locale('en','UK'),
    const Locale('ar','EG'),
    const Locale('es','ES'),
    const Locale('de','DE'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return '🇪🇬';
      case 'es':
        return '🇪🇸';
      case 'de':
        return '🇩🇪';
      case 'en':
      default:
        return '🇬🇧';
    }
  }

}