// import 'package:flutter/material.dart';
//
// enum AppThemeType {
//   basic,     // 무료
//   ocean,
//   sunset,
//   forest,
//   neon,
//   light,
//   dark
// }
//
// // 테마 변경됨을 전체적으로 설정하기 위해 공지하여 변경하도록 ChangeNotifier 클래스 사용한다.
// // class ThemeProvider extends ChangeNotifier {
// class ThemeProvider with ChangeNotifier {
//   // 현재 기본 테마 색상 = 보라색
//   AppThemeType _currentTheme = AppThemeType.basic;
//   /*
//   구매한 테마를 담아놓는 변수
//   기본적으로 무료인 보라색 테마를 담아놓는다.
//    */
//   final Set<AppThemeType> _purchasedThemes = {
//     AppThemeType.basic,
//     AppThemeType.sunset ,
//     AppThemeType.ocean
//   };
//
//   AppThemeType get currentTheme => _currentTheme;
//   bool isThemePurchased(AppThemeType theme) => _purchasedThemes.contains(theme);
//
//   // Todo==========================그라데이션
//   // Color get gradientStart => _getGradientColors(_currentTheme).start;
//   // Color get gradientEnd   => _getGradientColors(_currentTheme).end;
//   //
//   // ({Color start, Color end}) _getGradientColors(AppThemeType theme) {
//   //   switch (theme) {
//   //     case AppThemeType.basic:
//   //       return (start: const Color(0xFF6A1B9A), end: const Color(0xFFAB47BC));     // 보라 → 연보라
//   //     case AppThemeType.ocean:
//   //       return (start: const Color(0xFF0288D1), end: const Color(0xFF4FC3F7));     // 진한 블루 → 시안
//   //     case AppThemeType.sunset:
//   //       return (start: const Color(0xFFFF5722), end: const Color(0xFFFFC107));     // 오렌지 → 옐로우
//   //     case AppThemeType.forest:
//   //       return (start: const Color(0xFF1B5E20), end: const Color(0xFF81C784));     // 다크 그린 → 라이트 그린
//   //     case AppThemeType.neon:
//   //       return (start: const Color(0xFF00E676), end: const Color(0xFFFF1744));     // 네온 그린 → 네온 핑크/레드
//   //     case AppThemeType.light:
//   //       return (start: const Color(0xFFFFF176), end: const Color(0xFFFFAB91));     // 라이트 옐로우 → 피치
//   //     case AppThemeType.dark:
//   //       return (start: const Color(0xFF212121), end: const Color(0xFF616161));     // 다크 그레이 → 미디엄 그레이
//   //   }
//   // }
//
//   ThemeData get themeData {
//     switch(_currentTheme) {
//       case AppThemeType.basic:
//       return _buildTheme(
//         primary: const Color(0xFF6000EE),
//         secondary: const Color(0xFF03DAC6)
//
//       );
//       // case AppThemeType.ocean:
//       //   return _buildTheme(
//       //       primary: const Color(0xFF00FFFC),
//       //       secondary: const Color(0xFF03DAC6)
//       //   );
//       case AppThemeType.sunset:
//         return _buildTheme(
//             primary: const Color(0xFFFF0066),
//             secondary: const Color(0xFF03DAC6)
//         );
//       case AppThemeType.forest:
//         return _buildTheme(
//             primary: const Color(0xFF00FF33),
//             secondary: const Color(0xFF03DAC6)
//         );
//       // case AppThemeType.neon:
//       //   return _buildTheme(
//       //       primary: const Color(0xFFECFD00),
//       //       secondary: const Color(0xFF03DAC6)
//       //   );
//       case AppThemeType.light:
//         return _buildTheme(
//             primary: const Color(0xFFFFF2BB),
//             secondary: const Color(0xFF03DAC6)
//         );
//       case AppThemeType.dark:
//         return _buildTheme(
//             primary: const Color(0xFF7C5F5F),
//             secondary: const Color(0xFF03DAC6)
//         );
//
//
//       case AppThemeType.ocean:
//         return _buildTheme(
//           primary: const Color(0xFF006699),
//           secondary: const Color(0xFF00DDFF),
//           tertiary: const Color(0xFFB2EBF2),
//           variant: DynamicSchemeVariant.vibrant,
//           contrastLevel: 0.5,
//         );
//       case AppThemeType.neon:
//         return _buildTheme(
//           primary: const Color(0xFF39FF14),
//           secondary: const Color(0xFFFF00AA),
//           tertiary: const Color(0xFF00FFFF),
//           variant: DynamicSchemeVariant.vibrant,
//           contrastLevel: 0.8,
//         );
//     }
//   }
//
//   // ThemeData _buildTheme({
//   //   required Color primary,
//   //   required Color secondary
//   // }){
//   //   return ThemeData(
//   //     useMaterial3: true,
//   //     colorScheme: ColorScheme.fromSeed(
//   //         seedColor: primary,
//   //         secondary: secondary,
//   //         // colorScheme처럼 세부 속성 설정하며 기본 primary 색상의 규정을 세부 속성 설정 안 한 디자인 구역에 배치하겠다.
//   //         // colorScheme: ColorScheme(
//   //         //   primary: primary,
//   //         //   onPrimary: Colors.white,
//   //         //   primaryContainer: Color(0xFFBB86FC),
//   //         //   onPrimaryContainer: Color(0xFF3700B3),
//   //         //   secondary: secondary,
//   //         //   brightness: null,
//   //         //   onSecondary: null,
//   //         //   error: null,
//   //         //   onError: null,
//   //         //   surface: null,
//   //         //   onSurface: null
//   //         // ),
//   //     ),
//   //       scaffoldBackgroundColor: const Color(0xffe1fff5)        // 0xFF (불투명도) + F5F5F5 (HEX 색상도)
//   //   );
//   // }
//
//   ThemeData _buildTheme({
//     required Color primary,
//     required Color secondary,
//     Color? tertiary,           // ← 추천! 대비용 액센트 색상
//     Color? error,              // 에러 색상 (기본 빨강)
//     Brightness brightness = Brightness.light,
//     // DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot, // 스타일 변형
//     DynamicSchemeVariant variant = DynamicSchemeVariant.vibrant, // 스타일 변형
//     double contrastLevel = 0.4, // 0.0 ~ 1.0 사이에서 조정
//   }) {
//     return ThemeData(
//       useMaterial3: true,
//       colorScheme: ColorScheme.fromSeed(
//         seedColor: primary,
//         secondary: secondary,
//         tertiary: tertiary,                       // ← 직접 지정 가능
//         error: error ?? const Color(0xFFB3261E),  // 기본 Material 에러
//         brightness: brightness,
//         dynamicSchemeVariant: variant,            // tonalSpot(기본), fidelity(씨드 충실), vibrant 등
//         // contrastLevel: 0.0,                       // 필요시 0.5~1.0으로 접근성 강화
//         contrastLevel: contrastLevel
//       ),
//       scaffoldBackgroundColor: const Color(0xffe1fff5), // 또는 colorScheme.surface 사용 추천
//     );
//   }
//
//   void changeTheme(AppThemeType theme) {
//     // 만약 구매한 테마가 있고, 구매한 테마를 선택하면 전체적으로 교체한다.
//     if(_purchasedThemes.contains(theme)){
//       _currentTheme = theme;
//       notifyListeners();
//     }
//   }
//
//   // 테마 구매 = 나중에는 토스 결제 로직이 들어가야한다.
//   Future<bool> purchaseTheme(AppThemeType theme) async {
//     // 실제 결제 로직 변경하는 구간
//     await Future.delayed(const Duration(seconds: 1));   // 결제되는 듯한 시뮬레이션
//     _purchasedThemes.add(theme);
//     notifyListeners();
//     return true;
//   }
//
//   String getThemeName(AppThemeType theme) {
//     switch (theme) {
//       case AppThemeType.basic:
//         return 'Basic (Default)';
//       case AppThemeType.ocean:
//         return 'Ocean Theme';
//       case AppThemeType.sunset:
//         return 'Sunset Theme';
//       case AppThemeType.forest:
//         return 'forest Theme';
//       case AppThemeType.neon:
//         return 'neon Theme';
//       case AppThemeType.light:
//         return 'light Theme';
//       case AppThemeType.dark:
//         return 'dark Theme';
//     }
//   }
//
//   String getThemePrice(AppThemeType theme) {
//     switch (theme) {
//       case AppThemeType.basic:
//         return 'Free';
//       case AppThemeType.ocean:
//         return '2,200';
//       case AppThemeType.sunset:
//         return '3,300';
//       case AppThemeType.forest:
//         return '3,300';
//       case AppThemeType.neon:
//         return '3,300';
//       case AppThemeType.light:
//         return '5,000';
//       case AppThemeType.dark:
//         return '5,000';
//     }
//   }
// }


//=================================== gradient

import 'package:flutter/material.dart';

enum AppThemeType {
  basic,     // 무료
  ocean,
  sunset,
  forest,
  neon,
  light,
  dark
}

class ThemeProvider with ChangeNotifier {
  AppThemeType _currentTheme = AppThemeType.basic;

  final Set<AppThemeType> _purchasedThemes = {
    AppThemeType.basic,
    AppThemeType.ocean,
    AppThemeType.sunset,
  };

  AppThemeType get currentTheme => _currentTheme;
  bool isThemePurchased(AppThemeType theme) => _purchasedThemes.contains(theme);

  // 그라데이션 색상 쌍
  Color get gradientStart => _getGradientColors(_currentTheme).start;
  Color get gradientEnd   => _getGradientColors(_currentTheme).end;

  ({Color start, Color end}) _getGradientColors(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.basic:
        return (start: const Color(0xFF9D00FF), end: const Color(0xFFFF0098));
      case AppThemeType.sunset:
        return (start: const Color(0xFFFF0098), end: const Color(0xFFFFEA00));
      case AppThemeType.ocean:
        return (start: const Color(0xFF2E6DFF), end: const Color(0xFF00FFD0));
      case AppThemeType.forest:
        return (start: const Color(0xFF008F09), end: const Color(0xFFC0FF00));
      case AppThemeType.neon:
        return (start: const Color(0xFF00FF47), end: const Color(0xFFFF1744));
      case AppThemeType.light:
        return (start: const Color(0xFFFFF19A), end: const Color(0xFFFFD0D0));
      case AppThemeType.dark:
        return (start: const Color(0xFF6E6E6E), end: const Color(0xFFC5C5C5));
    }
  }

  ThemeData get themeData {
    switch (_currentTheme) {
      case AppThemeType.basic:
        return _buildTheme(
          primary: const Color(0xFF6200EE),
          secondary: const Color(0xFF03DAC6),
        );

      case AppThemeType.ocean:
        return _buildTheme(
          primary: const Color(0xFF006699),
          secondary: const Color(0xFF00DDFF),
          tertiary: const Color(0xFFB2EBF2),
          variant: DynamicSchemeVariant.vibrant,
          contrastLevel: 0.5,
        );

      case AppThemeType.sunset:
        return _buildTheme(
          primary: const Color(0xFFFF5252),
          secondary: const Color(0xFFFF9800),
          tertiary: const Color(0xFFFFC107),
          variant: DynamicSchemeVariant.expressive,
          contrastLevel: 0.6,
        );

      case AppThemeType.forest:
        return _buildTheme(
          primary: const Color(0xFF1B5E20),
          secondary: const Color(0xFF66BB6A),
          tertiary: const Color(0xFF8BC34A),
          variant: DynamicSchemeVariant.fidelity,
          contrastLevel: 0.4,
        );

      case AppThemeType.neon:
        return _buildTheme(
          primary: const Color(0xFF39FF14),
          secondary: const Color(0xFFFF00AA),
          tertiary: const Color(0xFF00FFFF),
          variant: DynamicSchemeVariant.vibrant,
          contrastLevel: 0.8,
        );

      case AppThemeType.light:
        return _buildTheme(
          primary: const Color(0xFFFFF176),
          secondary: const Color(0xFFFFAB91),
          brightness: Brightness.light,
          variant: DynamicSchemeVariant.content,
          contrastLevel: 0.3,
        );

      case AppThemeType.dark:
        return _buildTheme(
          primary: const Color(0xFF212121),
          secondary: const Color(0xFFFF5252),
          tertiary: const Color(0xFFAB47BC),
          brightness: Brightness.dark,
          variant: DynamicSchemeVariant.fidelity,
          contrastLevel: 0.5,
        );
    }

    // 안전장치: 절대 도달하지 않아야 하지만...
    return _buildTheme(
      primary: const Color(0xFF6200EE),
      secondary: const Color(0xFF03DAC6),
    );
  }

  ThemeData _buildTheme({
    required Color primary,
    required Color secondary,
    Color? tertiary,
    Color? error,
    Brightness brightness = Brightness.light,
    DynamicSchemeVariant variant = DynamicSchemeVariant.vibrant,
    double contrastLevel = 0.4,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: primary,
      secondary: secondary,
      tertiary: tertiary,
      error: error ?? const Color(0xFFB3261E),
      brightness: brightness,
      dynamicSchemeVariant: variant,
      contrastLevel: contrastLevel,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: null, // ← 그라데이션 쓸 거라 null로 설정
    );
  }

  void changeTheme(AppThemeType theme) {
    if (_purchasedThemes.contains(theme)) {
      _currentTheme = theme;
      notifyListeners();
    }
  }

  Future<bool> purchaseTheme(AppThemeType theme) async {
    await Future.delayed(const Duration(seconds: 1));
    _purchasedThemes.add(theme);
    notifyListeners();
    return true;
  }

  String getThemeName(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.basic:   return 'Basic (Default)';
      case AppThemeType.ocean:   return 'Ocean Theme';
      case AppThemeType.sunset:  return 'Sunset Theme';
      case AppThemeType.forest:  return 'Forest Theme';
      case AppThemeType.neon:    return 'Neon Theme';
      case AppThemeType.light:   return 'Light Theme';
      case AppThemeType.dark:    return 'Dark Theme';
    }
  }

  String getThemePrice(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.basic:   return 'Free';
      case AppThemeType.ocean:   return '2,200';
      case AppThemeType.sunset:  return '3,300';
      case AppThemeType.forest:  return '3,300';
      case AppThemeType.neon:    return '3,300';
      case AppThemeType.light:   return '5,000';
      case AppThemeType.dark:    return '5,000';
    }
  }
}