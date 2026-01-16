import 'package:frontend/screens/game_screen.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/map_screen.dart';
import 'package:frontend/screens/scaffold_screen.dart';
import 'package:frontend/screens/theme_setting_screen.dart';
import 'package:frontend/screens/todo_list_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const TodoListScreen()
      ),
      GoRoute(
          path: '/theme-settings',
          builder: (context, state) => const ThemeSettingScreen()
      ),
      GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen()
      ),
      GoRoute(
          path: '/map',
          builder: (context, state) => MapScreen()
      ),
      GoRoute(
          path: '/scaf',
          builder: (context, state) => const ScaffoldScreen()
      ),
      GoRoute(
          path: '/game',
          builder: (context, state) => const GameScreen()
      ),
    ],
  );
}
