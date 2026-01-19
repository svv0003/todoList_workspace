import 'package:flutter/cupertino.dart';
import 'package:frontend/widgets/games/background_widget.dart';
import 'package:frontend/widgets/games/barrier_widget.dart';
import 'package:frontend/widgets/games/bird_widget.dart';

class GameAreaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // TODO: BackgroundWidget (파란 배경)
        BackgroundWidget(),

        // TODO: BirdWidget
        BirdWidget(),

        // TODO: BarrierWidget
        BarrierWidget(),

        // TODO: GameOverListener

      ],
    );
  }
}
