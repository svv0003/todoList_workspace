
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed
  });

  /*
  액션 버튼을 호출 시 호출하는 스크린에서 필수 매개변수로 icon, label, color를 입력할 것이고,
  입력한 값을 불러와서 아래 내용에 입력할 것이다.
   */
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(label),
      icon: Icon(icon, size: 18),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 20,     // 좌우 : 20px
          vertical: 12        // 상하 : 12px
        )
      ),
    );
  }
}