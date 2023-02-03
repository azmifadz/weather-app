import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// supported locales in this app
/// the first locale will be the start and fallback locale
const supportedLocales = [Locale('en', 'US')];

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        home: widget,
      ),
    );
  }
}
