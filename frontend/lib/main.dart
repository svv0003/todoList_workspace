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
  // .env 파일 로드 (사용하는 경우)
  // await dotenv.load(fileName: ".env");

  // 환경 정보 출력 (개발 모드에서만)
  // EnvConfig.printEnvInfo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider가 하나일 때
    // return ChangeNotifierProvider(
    //    create: (_) => TodoProvider()
    //    child: const MaterialApp( ... )
    // ),


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
            // return MaterialApp(
            // debugShowCheckedModeBanner: false,
            // title: AppConstants.appName,
            // theme: themeProvider.themeData,
            // // home: const TodoListScreen(),
            // // home: MapScreen(),
            // // home: ScaffoldScreen(),
            // home: FontScreen(),
            // );

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
