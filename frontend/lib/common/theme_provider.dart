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

// 테마 변경됨을 전체적으로 설정하기 위해 공지하여 변경하도록 ChangeNotifier 클래스 사용한다.
// class ThemeProvider extends ChangeNotifier {
class ThemeProvider with ChangeNotifier {
  // 현재 기본 테마 색상 = 보라색
  AppThemeType _currentTheme = AppThemeType.basic;
  /*
  구매한 테마를 담아놓는 변수
  기본적으로 무료인 보라색 테마를 담아놓는다.
   */
  final Set<AppThemeType> _purchasedThemes = {
    AppThemeType.basic,
    AppThemeType.sunset ,
    AppThemeType.ocean
  };

  AppThemeType get currentTheme => _currentTheme;
  bool isThemePurchased(AppThemeType theme) => _purchasedThemes.contains(theme);

  ThemeData get themeData {
    switch(_currentTheme) {
      case AppThemeType.basic:
      return _buildTheme(
        primary: const Color(0xFF6000EE),
        secondary: const Color(0xFF03DAC6)

      );
      case AppThemeType.ocean:
        return _buildTheme(
            primary: const Color(0xFF00FFFC),
            secondary: const Color(0xFF03DAC6)
        );
      case AppThemeType.sunset:
        return _buildTheme(
            primary: const Color(0xFFFF0066),
            secondary: const Color(0xFF03DAC6)
        );
      case AppThemeType.forest:
        return _buildTheme(
            primary: const Color(0xFF00FF33),
            secondary: const Color(0xFF03DAC6)
        );
      case AppThemeType.neon:
        return _buildTheme(
            primary: const Color(0xFFECFD00),
            secondary: const Color(0xFF03DAC6)
        );
      case AppThemeType.light:
        return _buildTheme(
            primary: const Color(0xFFFFF2BB),
            secondary: const Color(0xFF03DAC6)
        );
      case AppThemeType.dark:
        return _buildTheme(
            primary: const Color(0xFF7C5F5F),
            secondary: const Color(0xFF03DAC6)
        );
    }
  }

  // ThemeData _buildTheme({
  //   required Color primary,
  //   required Color secondary
  // }){
  //   return ThemeData(
  //     useMaterial3: true,
  //     colorScheme: ColorScheme.fromSeed(
  //         seedColor: primary,
  //         secondary: secondary,
  //         // colorScheme처럼 세부 속성 설정하며 기본 primary 색상의 규정을 세부 속성 설정 안 한 디자인 구역에 배치하겠다.
  //         // colorScheme: ColorScheme(
  //         //   primary: primary,
  //         //   onPrimary: Colors.white,
  //         //   primaryContainer: Color(0xFFBB86FC),
  //         //   onPrimaryContainer: Color(0xFF3700B3),
  //         //   secondary: secondary,
  //         //   brightness: null,
  //         //   onSecondary: null,
  //         //   error: null,
  //         //   onError: null,
  //         //   surface: null,
  //         //   onSurface: null
  //         // ),
  //     ),
  //       scaffoldBackgroundColor: const Color(0xffe1fff5)        // 0xFF (불투명도) + F5F5F5 (HEX 색상도)
  //   );
  // }
  ThemeData _buildTheme({
    required Color primary,
    required Color secondary,
    Color? tertiary,           // ← 추천! 대비용 액센트 색상
    Color? error,              // 에러 색상 (기본 빨강)
    Brightness brightness = Brightness.light,
    DynamicSchemeVariant variant = DynamicSchemeVariant.tonalSpot, // 스타일 변형
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        secondary: secondary,
        tertiary: tertiary,               // ← 직접 지정 가능
        error: error ?? const Color(0xFFB3261E), // 기본 Material 에러
        brightness: brightness,
        dynamicSchemeVariant: variant,    // tonalSpot(기본), fidelity(씨드 충실), vibrant 등
        contrastLevel: 0.0,               // 필요시 0.5~1.0으로 접근성 강화
      ),
      scaffoldBackgroundColor: const Color(0xffe1fff5), // 또는 colorScheme.surface 사용 추천
    );
  }

  void changeTheme(AppThemeType theme) {
    // 만약 구매한 테마가 있고, 구매한 테마를 선택하면 전체적으로 교체한다.
    if(_purchasedThemes.contains(theme)){
      _currentTheme = theme;
      notifyListeners();
    }
  }

  // 테마 구매 = 나중에는 토스 결제 로직이 들어가야한다.
  Future<bool> purchaseTheme(AppThemeType theme) async {
    // 실제 결제 로직 변경하는 구간
    await Future.delayed(const Duration(seconds: 1)); // 결제되는 듯한 시뮬레이션
    _purchasedThemes.add(theme);
    notifyListeners();
    return true;
  }

  String getThemeName(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.basic:
        return 'Basic (Default)';
      case AppThemeType.ocean:
        return 'Ocean Theme';
      case AppThemeType.sunset:
        return 'Sunset Theme';
      case AppThemeType.forest:
        return 'forest Theme';
      case AppThemeType.neon:
        return 'neon Theme';
      case AppThemeType.light:
        return 'light Theme';
      case AppThemeType.dark:
        return 'dark Theme';
    }
  }

  String getThemePrice(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.basic:
        return 'Free';
      case AppThemeType.ocean:
        return '2,200';
      case AppThemeType.sunset:
        return '3,300';
      case AppThemeType.forest:
        return '3,300';
      case AppThemeType.neon:
        return '3,300';
      case AppThemeType.light:
        return '5,000';
      case AppThemeType.dark:
        return '5,000';
    }
  }
}
