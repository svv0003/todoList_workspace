import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/game_provider_second.dart';
import 'package:provider/provider.dart';

class GameOverListener extends StatefulWidget {
  @override
  _GameOverListenerState createState() => _GameOverListenerState();
}

class _GameOverListenerState extends State<GameOverListener> {
  bool _previousGameState = false;

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProviderSecond>();

    // TODO: 게임 오버 조건 체크
    // (_previousGameState && !game.gameStarted && game.score > 0)

    // TODO: 조건이 참이면 다이얼로그 표시

    // TODO: _previousGameState 업데이트

    return SizedBox.shrink();
  }

  void _showGameOverDialog(BuildContext context, int score) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          // TODO: 제목, 내용, 버튼 구현
        );
      },
    );
  }
}
