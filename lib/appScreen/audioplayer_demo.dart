import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//audio asset player but this library causes platform exception due to flutter sdk issues.

class AudioPlayerDemo extends StatefulWidget {
  @override
  AudioPlayerDemoState createState() => AudioPlayerDemoState();
}

class AudioPlayerDemoState extends State<AudioPlayerDemo> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    setuuPlayList();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
  }

  void setuuPlayList() async {
    audioPlayer.open(
      Audio("assets/audios/meditation.mp3"),
      autoStart:true,
      showNotification: true,
    );

  }

  playMusic() async {
    await audioPlayer.play();
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  skipToNextMusic() async {
    await audioPlayer.next();
  }

  skipToPreviousMusic() async {
    await audioPlayer.previous();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
             body: Container(
              alignment: Alignment.center,
              child: audioPlayer.builderIsPlaying(
                 builder: (context, isPlaying) {
                 return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   IconButton(
                           iconSize: 50,
                          icon: Icon(Icons.skip_previous_rounded),
                          onPressed: () => skipToPreviousMusic()),
                       IconButton(
                          iconSize: 50,
                           icon: Icon(isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded),
                          onPressed: () => isPlaying ? pauseMusic() : playMusic()),
                     IconButton(
                          iconSize: 50,
                          icon: Icon(Icons.skip_next_rounded),
                          onPressed: () => skipToNextMusic())
                    ],
                   );
                },
             ),
            ),
           );
  }



}