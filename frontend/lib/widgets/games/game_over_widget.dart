import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider_second.dart';

class GameOverListener extends StatefulWidget {
  const GameOverListener({super.key});

  @override
  State<GameOverListener> createState() => _GameOverListenerState();
}

class _GameOverListenerState extends State<GameOverListener> {
  bool _wasGameStarted = false;

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProviderSecond>();
    if (_wasGameStarted && !game.gameStarted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _showGameOverDialog(context, game);
        }
      });
    }
    _wasGameStarted = game.gameStarted;
    return const SizedBox.shrink();
  }

  void _showGameOverDialog(BuildContext context, GameProviderSecond game) {
    String reason;
    if(game.gameTime >= game.targetTime) {
      reason = "시간 종료되었습니다.";
    }
    else if(game.score >= game.targetScore) {
      reason = "목표 점수에 도달했습니다.";
    }
    else {
      reason = "게임이 종료되었습니다.";
    }

    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text(
          '게임 종료',
          textAlign: TextAlign.center
      ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*
            const Text msg 작성하고 싶다면 String msg 변수 앞에
            const String msg 상수, 즉 변할 수 없는 글자 데이터로 작성해야 한다.
            Text 글자가 변동된다면 const Text 고정 불가!!
             */
            Text(
              reason,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              "진행 시간 : ${game.gameTime.toStringAsFixed(1)}초",
            )
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
            game.resetGame();
          },
            child: const Text("다시 시작"),
          )
        ]
      ),
    );
  }
}