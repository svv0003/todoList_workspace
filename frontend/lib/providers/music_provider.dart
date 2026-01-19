import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class MusicProvider with ChangeNotifier {
  bool _isPlaying = false;
  int _progress = 0;
  String _currentSong = "노래 1";
  int _songNumber = 1;

  // 음악 랜덤 재생시간
  double _totalDurationSeconds = 0.0;

  // Getters
  bool get isPlaying => _isPlaying;
  int get progress => _progress;
  String get currentSong => _currentSong;


  // 타이머 객체
  Timer? _timer;

  MusicProvider() {
    _updateSongDisplay();
    _resetDuration();
  }

  /*
  T/F 값에 따라 값 변환하기
  T -> 음악 진행 시작
  F -> 타이머 중지
   */
  void togglePlay() {
    _isPlaying = !_isPlaying;

    if (_isPlaying) {
      _startProgressTimer();
    } else {
      _timer?.cancel();
    }
    notifyListeners();
  }

  // 3~4분 사이 랜덤 시간 설정 (초 단위)
  void _resetDuration() {
    final random = Random();
    _totalDurationSeconds = 180 + random.nextDouble() * 60; // 180 ~ 240초
  }

  void nextSong() {
    _timer?.cancel();
    _songNumber++;
    _updateSongDisplay();
    _resetDuration();
    _progress = 0;
    if (_isPlaying) {
      _startProgressTimer();
    }
    notifyListeners();
  }

  void previousSong() {
    _timer?.cancel();
    if (_songNumber > 1) {
      _songNumber--;
    }
    _updateSongDisplay();
    _resetDuration();
    _progress = 0;
    if (_isPlaying) {
      _startProgressTimer();
    }
    notifyListeners();
  }

  void _updateSongDisplay() {
    _currentSong = "노래 $_songNumber";
  }

  // 재생시간별 타이머
  void _startProgressTimer() {
    _timer?.cancel();

    final double msPerPercent = (_totalDurationSeconds * 1000) / 100;

    _timer = Timer.periodic(Duration(milliseconds: msPerPercent.round()), (timer) {
      if (!_isPlaying) {
        timer.cancel();
        return;
      }
      _progress += 1;
      if (_progress >= 100) {
        timer.cancel();
        nextSong();
      }
      notifyListeners();
    });
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}