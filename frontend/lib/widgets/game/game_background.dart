import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GameBackground extends StatelessWidget {
  const GameBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // print('✨ GameBackground 생성됨 (게임 배경 화면을 다시 그리기 때문에 무거운 작업이다.');
    if (kDebugMode) {
      print('✨ GameBackground 생성됨 (게임 배경 화면을 다시 그리기 때문에 무거운 작업이다.');
    }

    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orange, Colors.red],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          '🌅 게임 배경',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}