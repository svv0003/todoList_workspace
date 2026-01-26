import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/game_provider_second.dart';
import 'package:provider/provider.dart';

class BarrierWidget extends StatelessWidget {
  const BarrierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProviderSecond>();

    return Stack(
      children: [
        // TODO: 아래쪽 장애물
        AnimatedContainer(
          duration: Duration(milliseconds: 0),
          alignment: Alignment(game.barrierX, 1.1),
          child: Container(
            width: 120,
            height: game.barrierHeight,
            // color: Colors.green[700],
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/knife_bottom.png'),
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.none,
                  alignment: Alignment.topCenter,
                )
            ),
          ),
        ),

        // TODO: 위쪽 장애물
        AnimatedContainer(
          duration: Duration(milliseconds: 0),
          alignment: Alignment(game.barrierX, -1.1),
          child: Container(
            width: 120,
            height: game.barrierHeight,
            // color: Colors.green[700],
            child: AnimatedContainer(
              duration: Duration(milliseconds: 0),
              alignment: Alignment(game.barrierX, -1.1),
              child: Transform.flip(
                flipY: true,          // true → 상하 뒤집기 (이게 핵심!)
                flipX: false,         // 필요하면 true로 해서 좌우도 뒤집기
                // flipX: true && flipY: true → 180도 회전과 동일
                child: Image.asset(
                  'assets/images/knife_bottom.png',
                  width: 80,
                  height: game.barrierHeight,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.none,
                  alignment: Alignment.bottomCenter,  // 뒤집힌 후에도 칼날 위치 조정
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
