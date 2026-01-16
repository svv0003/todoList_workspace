import 'package:flutter/cupertino.dart';

class MusicProvider with ChangeNotifier {
  bool _isPlaying = false;
  int _progress = 0;
  String _currentSong = "노래 1";

  // getter들...
  //
  // void togglePlay() { ... }
  // void nextSong() { ... }
  // void previousSong() { ... }
  // void updateProgress(int value) { ... }
}
