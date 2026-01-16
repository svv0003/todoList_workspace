
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/theme/theme_card.dart';
import 'package:frontend/widgets/theme/theme_purchase_dialog.dart';

import '../../providers/theme_provider.dart';

class ThemeList extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ThemeList({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    final themes = [
      (AppThemeType.basic, Color(0xFF6000EE)),
      (AppThemeType.sunset, Color(0xFFFF0066)),
      (AppThemeType.ocean, Color(0xFF00FFFC)),
      (AppThemeType.forest, Color(0xFF00FF33)),
      (AppThemeType.neon, Color(0xFFECFD00)),
      (AppThemeType.light, Color(0xFFFFF2BB)),
      (AppThemeType.dark, Color(0xFF7C5F5F)),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('테마선택'),
        ...themes.map((data) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ThemeCard(
              themeProvider: themeProvider,
              theme: data.$1,
              color: data.$2,
              onPurchaseRequested: () => showDialog(
                  context: context,
                  builder: (_) => ThemePurchaseDialog(
                      themeProvider: themeProvider, theme: data.$1))),
        ))
      ],
    );
  }
}