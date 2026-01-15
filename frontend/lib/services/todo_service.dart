// lib/services/todo_service.dart
// API 통신 서비스

import 'package:dio/dio.dart';
import '../common/constants.dart';
import '../models/todo_model.dart';

class TodoService {
  late final Dio _dio;

  TodoService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,                // 또는 EnvConfig.apiBaseUrl 사용 가능
        connectTimeout: const Duration(seconds: 5),   // 5초 타임아웃
        receiveTimeout: const Duration(seconds: 3),   // 3초 타임아웃
        headers: {'Content-Type': 'application/json'},
      ),
    );
    // 필요 시 인터셉터 추가 (로깅, 토큰 등)
    // _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  /// 전체 Todo 목록 가져오기
  Future<List<TodoModel>> fetchTodos() async {
    try {
      // final response = await _dio.get(ApiConstants.todosUrl);
      final response = await _dio.get('/todos');
      final List<dynamic> data = response.data;
      return data.map((json) => TodoModel.fromJson(json)).toList();
      // if (response.statusCode == 200) {
      //   final List<dynamic> data = response.data;
      //   return data.map((json) => TodoModel.fromJson(json)).toList();
      // } else {
      //   throw Exception('${ErrorMessages.loadFailed} (Status: ${response.statusCode})');
      // }
    } on DioException catch (e) {
      if(e.type == DioExceptionType.connectionTimeout
          || e.type == DioExceptionType.receiveTimeout){
        throw Exception(ErrorMessages.networkError);
      } else if(e.response?.statusCode != null || e.response!.statusCode! >= 500){
        throw Exception(ErrorMessages.serverError);
      } else throw Exception(ErrorMessages.loadFailed);
    } catch (e) {
      throw Exception('${ErrorMessages.loadFailed} - $e');
    }
  }
  /*
  http보다 Dio 사용하는 이유는
  http는 네트워크 통신 자체가 실패했을 때만 예외를 던지고,
  HTTP 에러 상태 코드(400, 500 등)는 정상 응답으로 취급하지만
  Dio는 상태 코드 기반 예외를 자동으로 던질 수 있다.
   */

  /// 새 Todo 추가
  Future<void> addTodo(String content) async {
    try {
      final response = await _dio.post(
        ApiConstants.todosUrl,
        data: {
          'content': content,
          'isCompleted': false,
        },
      );

      if (response.statusCode != 201 && response.statusCode != 200) {
        throw Exception('${ErrorMessages.createFailed} (Status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception('${ErrorMessages.createFailed} - ${e.message}');
    } catch (e) {
      throw Exception('${ErrorMessages.createFailed} - $e');
    }
  }

  /// Todo 완료 상태 토글
  Future<void> toggleTodo(int id, bool isCompleted) async {
    try {
      final response = await _dio.put(
        '${ApiConstants.todosUrl}/$id',
        data: {
          'isCompleted': isCompleted,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('상태 업데이트 실패 (Status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception('상태 업데이트 실패 - ${e.message}');
    } catch (e) {
      throw Exception('상태 업데이트 실패 - $e');
    }
  }

  /// Todo 삭제
  Future<void> deleteTodo(int id) async {
    try {
      final response = await _dio.delete('${ApiConstants.todosUrl}/$id');

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('${ErrorMessages.deleteFailed} (Status: ${response.statusCode})');
      }
    } on DioException catch (e) {
      throw Exception('${ErrorMessages.deleteFailed} - ${e.message}');
    } catch (e) {
      throw Exception('${ErrorMessages.deleteFailed} - $e');
    }
  }
}