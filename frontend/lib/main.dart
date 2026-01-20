import 'package:flutter/material.dart';
import 'package:frontend/providers/game_provider.dart';
import 'package:frontend/providers/game_provider_second.dart';
import 'package:frontend/providers/music_provider.dart';
import 'package:frontend/screens/font_screen.dart';
import 'package:frontend/screens/game_screen.dart';
import 'package:frontend/screens/scaffold_screen.dart';
import 'package:provider/provider.dart';
import 'common/app_router.dart';
import 'common/constants.dart';
import 'providers/theme_provider.dart';
import 'providers/todo_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => MusicProvider()),
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProvider(create: (_) => GameProviderSecond()),
      ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: AppConstants.appName,
              theme: themeProvider.themeData,
              routerConfig: AppRouter.router
            );
          },
        ),
    );
  }
}
