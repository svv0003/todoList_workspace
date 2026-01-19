// lib/widgets/music/lyrics_display.dart
import 'package:flutter/material.dart';

class LyricsDisplay extends StatelessWidget {
  const LyricsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.purple.shade200),
      ),
      child: const SingleChildScrollView(
        child: Text(
          '''[Verse 1]
바람이 불어오는 길목에서
너의 향기가 스며들어와
시간이 멈춘 듯한 이 순간
영원히 간직하고 싶어

[Chorus]
너와 나의 멜로디
하늘 끝까지 퍼져가
이 노래가 끝나지 않길
영원히 함께해줘

[Verse 2]
별빛 아래서 약속했던 말들
하나도 잊지 않을게
너의 미소가 내 전부야
항상 곁에 있어줘''',
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}