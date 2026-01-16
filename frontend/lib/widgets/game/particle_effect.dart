import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ParticleEffect extends StatelessWidget {
  const ParticleEffect({super.key});

  @override
  Widget build(BuildContext context) {
    // print('💥 ParticleEffect 생성됨 (게임 이펙트 효과를 다시 그리기 때문에 무거운 작업이다.');
    if (kDebugMode) {
      print('💥 ParticleEffect 생성됨 (게임 이펙트 효과를 다시 그리기 때문에 무거운 작업이다.');
    }

    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
              (index) => const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.star, color: Colors.yellow, size: 30),
          ),
        ),
      ),
    );
  }
}