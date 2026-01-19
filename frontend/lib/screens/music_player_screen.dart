import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/music_provider.dart'; // 경로 확인 필요
import '../widgets/music/album_cover.dart';
import '../widgets/music/equalizer.dart';
import '../widgets/music/lyrics_display.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('음악 플레이어'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Consumer<MusicProvider>(
        builder: (context, musicProvider, child) {
          print('MusicPlayerScreen builder 실행 - 곡: ${musicProvider.currentSong}, 진행: ${musicProvider.progress}%');

          return Column(
            children: [
              // 상단 정보 영역 (곡 제목 + 재생 상태)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      musicProvider.currentSong,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      musicProvider.isPlaying ? '재생 중' : '일시정지',
                      style: TextStyle(
                        fontSize: 16,
                        color: musicProvider.isPlaying ? Colors.green : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // 진행바 + 퍼센트
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Slider(
                      value: musicProvider.progress.toDouble(),
                      min: 0,
                      max: 100,
                      activeColor: Colors.purple,
                      inactiveColor: Colors.purple.shade100,
                      onChanged: (value) {
                        // 필요 시 수동 조절 기능 추가 가능
                        // musicProvider.setProgress(value.toInt());
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${musicProvider.progress}%',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          '100%',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 정적 위젯들 (child로 전달됨)
              Expanded(child: child!),

              // 컨트롤 버튼들
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous, size: 48),
                      color: Colors.purple,
                      onPressed: musicProvider.previousSong,
                    ),
                    const SizedBox(width: 40),
                    IconButton(
                      icon: Icon(
                        musicProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 64,
                      ),
                      color: Colors.purple,
                      onPressed: musicProvider.togglePlay,
                    ),
                    const SizedBox(width: 40),
                    IconButton(
                      icon: const Icon(Icons.skip_next, size: 48),
                      color: Colors.purple,
                      onPressed: musicProvider.nextSong,
                    ),
                  ],
                ),
              ),
            ],
          );
        },

        // 무거운 위젯들 → 재빌드 방지
        child: const Column(
          children: [
            Expanded(
              flex: 3,
              child: AlbumCover(),
            ),
            Expanded(
              flex: 2,
              child: LyricsDisplay(),
            ),
            Expanded(
              flex: 2,
              child: Equalizer(),
            ),
          ],
        ),
      ),
    );
  }
}