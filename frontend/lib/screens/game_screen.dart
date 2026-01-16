import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/game_provider.dart';
import '../widgets/game/game_background.dart';
import '../widgets/game/game_character.dart';
import '../widgets/game/particle_effect.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.go("/"), icon: Icon(Icons.arrow_back)),
        title: const Text('게임 화면'),
        backgroundColor: Colors.purple,
      ),
      body: Consumer<GameProvider>(
        // child: const Column(
        //   children: [
        //     SizedBox(height: 20),
        //     GameCharacter(),
        //     SizedBox(height: 20),
        //     GameBackground(),
        //     SizedBox(height: 20),
        //     ParticleEffect(),
        //   ],
        // ),

        builder: (context, gameProvider, child) {
          print('builder 실행됨 점수: ${gameProvider.score}');

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '점수: ${gameProvider.score}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // child!,
               GameCharacter(),
               GameBackground(),
               ParticleEffect(),

              ElevatedButton(
                onPressed: () {
                  gameProvider.addScore();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  '점수 올리기 +10',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}