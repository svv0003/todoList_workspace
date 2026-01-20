import 'package:flutter/cupertino.dart';
import 'package:frontend/widgets/games/background_widget.dart';
import 'package:frontend/widgets/games/barrier_widget.dart';
import 'package:frontend/widgets/games/bird_widget.dart';
import 'package:frontend/widgets/games/game_over_widget.dart';

class GameAreaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundWidget(),
        const BirdWidget(),
        const BarrierWidget(),
        const GameOverListener()
      ],
    );
  }
}
