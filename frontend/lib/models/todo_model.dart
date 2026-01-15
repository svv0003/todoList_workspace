class TodoModel {
  final int? id;
  final String content;
  final bool isCompleted;
  final DateTime? createdAt;

  const TodoModel({
    this.id,
    required this.content,
    this.isCompleted = false,
    this.createdAt,
  });

  // JSON → TodoModel 변환 (서버에서 받아올 때 사용)
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int?,
      content: json['content'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
    );
  }

  // TodoModel → JSON 변환 (서버로 보낼 때 사용)
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'isCompleted': isCompleted,
      // id와 createdAt는 서버에서 생성하므로 보통 보내지 않음
    };
  }

  // 기존 객체를 기반으로 일부 필드만 변경한 새 객체 생성
  TodoModel copyWith({
    int? id,
    String? content,
    bool? isCompleted,
    DateTime? createdAt,
  }) {
    return TodoModel(
      id: id ?? this.id,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // 날짜를 보기 좋게 포맷팅한 문자열 -> 2026-01-12
  String get formattedDate {
    if (createdAt == null) return '';
    return '${createdAt!.year}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}';
  }
}