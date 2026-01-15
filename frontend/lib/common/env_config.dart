import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/common/constants.dart';

class EnvConfig {

  // 기본 API URL
  static String get apiBaseUrl =>
      dotenv.env['API_BASE_URL'] ?? ApiConstants.baseUrl;

  // 현재 환경 (development, production, staging 등)
  static String get environment =>
      dotenv.env['ENVIRONMENT']?.trim() ?? 'development';

  // 개발 환경인지 확인
  static bool get isDevelopment => environment == 'development';

  // 디버그 모드인지 확인
  static bool get isDebugMode => isDevelopment;

  // 환경 정보 콘솔 출력 (디버그 모드일 때만)
  static void printEnvInfo() {
    if (!isDebugMode) return;
    print('======= 환경 설정 =======');
    print('Environment: $environment');
    print('API URL    : $apiBaseUrl');
    print('========================');
  }
}