import 'package:flutter/material.dart';
import 'package:frontend/providers/game_provider_second.dart';
import 'package:frontend/widgets/games/ground_widget.dart';
import 'package:frontend/widgets/games/score_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/games/game_area_widget.dart';

/*
lib
├────── main.dart                              # 어플 시작점
├────── providers/
│        └────── game_provider.dart            # 게임 두뇌 (상태 관리/로직)
│                                               # 게임 상태 변수들 (새 위치, 점수, 장애물 위치 등)
│                                               # 게임 로직 (startGame, jump, 충돌 감지 등)
│                                               # 물리 엔진
│                                               # ChangeNotifier로 UI 상태 변경 알림
├────── screens/
│        └────── theme_setting_screen.dart     # 전체 화면 레이아웃 관리자
│                                               # 탭 제스처 처리 (GestureDetector)
│                                               # 위젯들을 조합하여 완성된 게임 화면 구성
│                                               # Provider와 UI를 연결하는 중간 다리 역할
└────── widgets/
         ├────── background_widget.dart               # 배경 그리기. 상태 변화 없는 정적 위젯
         ├────── barrier_widget.dart           # 장애물 표시 위/아래 2개의 녹색 장애물 렌더링
         │                                      # Provider에서 barrierX 위치 받아와서 이동
         │                                      # AnimatedContainer로 부드러운 이동 구현
         ├────── bird_widget.dart              # 플레이어 캐릭터 (새)
         │                                      # Provider에서 birdY 위치 받아와서 상하 이동
         │                                      # 중력에 따라 위치가 변함
         ├────── game_area_widget.dart         # 게임 플레이 영역 컨테이너
         │                                      # Stack 으로 여러 위젯을 겹쳐서 배치
         │                                      # 배경 + 새 + 장애물 + 게임 오버리스너 조합
         ├────── game_over_widget.dart         # 게임 오버 감지 및 다이얼로그 표시
         │                                      # 화면에는 보이지 않는 게임 감시자 위젯
         │                                      # 게임상태 계속 모니터링
         │                                      # 게임 오버 순간 감지하여 다이얼로그 표시 "다시 시작" 버튼으로 리셋 처리
         ├────── ground_widget.dart            # 화면 하단 바닥
         │                                      # 갈색 땅 영역 렌더링
         │                                      # 게임 영역과 구분되는 시각적요소 정적 위젯으로 상태 변환 없는 단순 UI 화면
         └────── score_widget.dart             #  점수 표시 영역
                                                # 게임 시작 전 : 탭하여 시작! 메세지 표시
                                                # 게임      중 : 점수 표기
                                                # provider 에서 gameStarted와 score 값 받아옴
 */

class GameScreenSecond extends StatelessWidget {
  const GameScreenSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final game = context.read<GameProviderSecond>();

        // TODO: 게임이 시작되지 않았으면 startGame() 호출
        if(!game.gameStarted) {
          game.startGame();
        }

        // TODO: jump() 호출
        game.jump();
      },
      child: Scaffold(
        body: Column(
          children: [
            // TODO: ScoreWidget (flex: 2)
            Expanded(
              flex: 2,
              child:ScoreWidget()
            ),

            // TODO: GameArea (flex: 5)
            Expanded(
              flex: 6,
              child: GameAreaWidget(),
            ),

            // TODO: GroundWidget (flex: 1)
            const Expanded(
                flex: 1,
                child:GroundWidget()
            ),
          ],
        ),
      ),
    );
  }
}