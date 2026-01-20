import 'package:flutter/material.dart';
import 'package:frontend/providers/game_provider_second.dart';
import 'package:provider/provider.dart';

/*
점수 표시하는 위젯
게임 시작 전에는 탭하여 시작
게임 중에는 현재 점수 표시
 */
class ScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProviderSecond>();

    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.blue[300],
        child: Center(
          child: game.gameStarted
            ? Column(
              children: [
                Text(
                  // game.gameStarted ? '점수 : ${game.score}' : '탭하여 시작',
                  game.gameStarted ? '점수 : ${game.remainingScore}' : '탭하여 시작',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text('시간 : ${game.remainingTime.toStringAsFixed(1)}',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white70
                  ),
                ),
              ]
            )
            : const Text(
              '탭하여 시작',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white
              ),
          )
        ),
      ),
    );
  }
}
