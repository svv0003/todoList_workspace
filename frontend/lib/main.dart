import 'package:flutter/material.dart';
import 'package:frontend/screens/map_screen.dart';
import 'package:frontend/screens/todo_list_screen.dart';
import 'package:provider/provider.dart';
import 'common/app_router.dart';
import 'common/app_styles.dart';
import 'common/constants.dart';
import 'common/env_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'common/theme_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.appName,
            theme: themeProvider.themeData,
            // home: const TodoListScreen(),
            // home: MapScreen(),
            home: MapScreen(),
            );
            // return MaterialApp.router(
            //   debugShowCheckedModeBanner: false,
            //   title: AppConstants.appName,
            //   theme: themeProvider.themeData,
            //   routerConfig: AppRouter.router
            // );
          },
        ),
    );
  }
}
