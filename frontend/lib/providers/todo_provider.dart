// lib/providers/todo_provider.dart
// Provider 상태 관리

import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../services/todo_service.dart';

class TodoProvider with ChangeNotifier {
  final TodoService _todoService = TodoService();

  List<TodoModel> _todos = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Getter들
  List<TodoModel> get todos => _todos;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  int get totalCount => _todos.length;
  int get completedCount => _todos.where((t) => t.isCompleted).length;
  int get activeCount => _todos.where((t) => !t.isCompleted).length;

  // Todo 목록 불러오기
  Future<void> loadTodos() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _todos = await _todoService.fetchTodos();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Todo 추가
  Future<void> addTodo(String content) async {
    try {
      await _todoService.addTodo(content);
      await loadTodos(); // 추가 후 목록 새로고침
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  // Todo 완료 상태 토글
  Future<void> toggleTodo(int id, bool isCompleted) async {
    try {
      await _todoService.toggleTodo(id, isCompleted);
      await loadTodos(); // 상태 변경 후 목록 새로고침
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  // Todo 삭제
  Future<void> removeTodo(int id) async {
    try {
      await _todoService.deleteTodo(id);
      await loadTodos(); // 삭제 후 목록 새로고침
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}