import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/music_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/music/album_cover.dart';
import '../widgets/music/equalizer.dart';
import '../widgets/music/lyrics_display.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('게임 화면'),
    //     backgroundColor: Colors.purple,
    //   ),
    //   body: Consumer<MusicProvider>(
    //       child: const Column(  // 무거운 위젯들 여기
    //         children: [
    //           AlbumCover(),
    //           LyricsDisplay(),
    //           Equalizer(),
    //         ],
    //       ),
    //
    //     builder: (context, musicProvider, child) {
    //       print('builder 실행됨 상태: ???, 진행: ${musicProvider.progress}%');
    //
    //
    //       return Column(
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.all(20),
    //             margin: const EdgeInsets.all(20),
    //             decoration: BoxDecoration(
    //               color: Colors.amber,
    //               borderRadius: BorderRadius.circular(15),
    //             ),
    //             child: [
    //               Text(musicProvider.currentSong),
    //               Icon(musicProvider.isPlaying ? Icons.pause : Icons.play_arrow),
    //
    //             ]
    //
    //           ),
    //
    //           child!,
    //
    //           ElevatedButton(
    //             onPressed: () {
    //               gameProvider.addScore();
    //             },
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: Colors.green,
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 40,
    //                 vertical: 15,
    //               ),
    //             ),
    //             child: const Text(
    //               '점수 올리기 +10',
    //               style: TextStyle(fontSize: 20),
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    );
  }
}