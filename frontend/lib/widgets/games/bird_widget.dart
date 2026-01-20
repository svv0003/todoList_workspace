import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/game_provider_second.dart';
import 'package:provider/provider.dart';

class BirdWidget extends StatelessWidget {
  const BirdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final birdY = context.watch<GameProviderSecond>().birdY;

    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      alignment: Alignment(0, birdY),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.yellow,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '💀',
            style: TextStyle(
              fontSize: 30
            ),
          ),
        ),
      ),
    );
  }
}
