// API 관련 상수
class ApiConstants {
  static const String baseUrl = 'http://localhost:8080/api';
  // static const String baseUrl = 'http://aws-1-ap-northeast-2.pooler.supabase.com:6543/api';
  static const String todosUrl = '/todos';
}

// 앱 기본 정보 상수
class AppConstants {
  static const String appName = 'My Todo List 2026';
  static const int maxContentLength = 255;
}

// 에러 메시지 상수
class ErrorMessages {
  static const String networkError = '네트워크 연결을 확인해주세요.';
  static const String serverError = '서버 오류가 발생했습니다.';
  static const String loadFailed = 'Todo 목록을 불러오는데 실패했습니다.';
  static const String createFailed = 'Todo 생성에 실패했습니다.';
  static const String deleteFailed = 'Todo 삭제에 실패했습니다.';
  static const String emptyContent = 'Todo 내용을 입력해주세요.';
}

// 다이얼로그 관련 메시지 상수
class DialogMessages {
  static const String deleteTitle = 'Todo 삭제';
  static const String deleteContent = '정말로 이 Todo를 삭제하시겠습니까?';
  static const String cancel = '취소';
  static const String delete = '삭제';
  static const String add = '추가';
}