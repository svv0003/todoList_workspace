import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/game_provider_second.dart';
import 'package:provider/provider.dart';

class BirdWidget extends StatelessWidget {
  const BirdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final birdY = context.watch<GameProviderSecond>().birdY;
    final gameStatus = context.watch<GameProviderSecond>();   // 게임 상태 확인한다.
    final birdY = gameStatus.birdY;


    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      alignment: Alignment(0, birdY),
      child: Transform.flip(
        flipX: gameStatus.gameStarted ? true : false,
        child: Container(
          width: gameStatus.gameStarted ? 70 : 140,
          height: gameStatus.gameStarted ? 70 : 140,
          // decoration: BoxDecoration(
          //   color: Colors.yellow,
          //   shape: BoxShape.circle,
          // ),
          // child: Center(
          //   child: Text(
          //     '💀',
          //     style: TextStyle(
          //       fontSize: 30
          //     ),
          //   ),
          // ),
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage('assets/images/R-Photoroom.png'),
              image: AssetImage(gameStatus.gameStarted ? 'assets/images/R-Photoroom.png' : 'assets/images/loading.gif'),
              fit: BoxFit.contain,
              filterQuality: FilterQuality.none
            )
          ),
        ),
      ),
    );
  }
}
