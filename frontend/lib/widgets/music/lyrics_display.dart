import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LyricsDisplay extends StatelessWidget {
  const LyricsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('노래 가사 생성됨');
    }
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 3),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80, color: Colors.blue),
            Text('가사', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}