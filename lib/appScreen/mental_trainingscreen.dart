import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'Seekbar.dart';

class MentalTrainingScreen extends StatefulWidget {
  @override
  _MentalTrainingScreenState createState() => _MentalTrainingScreenState();
}

class _MentalTrainingScreenState extends State<MentalTrainingScreen> {

  final player = AudioPlayer();

  @override
  void initState() {
     player.setAsset('assets/audio/meditation.mp3');
     player.play();
    super.initState();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor:Color(0xFF2D31AC),
    body:SingleChildScrollView(
      child: Container(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:40),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children:  [
                  Padding(
                    padding: EdgeInsets.only(right:50),
                    child: Text("Mental Training",style:TextStyle(color:Colors.white,fontSize:25),),
                  ),
                  GestureDetector(
                    onTap:()
                    {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right:20),
                      child: Icon(Icons.close,color:Colors.white,),
                    ),
                  )
                ],
              ),
            ),
            Stack(
              alignment:Alignment.bottomCenter,
              children: [
                Image.asset("assets/images/bgplaylist.png",fit:BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:50),
                  child: StreamBuilder<PlayerState>(
                    stream: player.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;
                      final processingState = playerState?.processingState;
                      final playing = playerState?.playing;
                      if (processingState == ProcessingState.loading ||
                          processingState == ProcessingState.buffering) {
                        return Container(
                          margin: EdgeInsets.all(8.0),
                          width: 64.0,
                          height: 64.0,
                          child: CircularProgressIndicator(),
                        );
                      } else if (playing != true) {
                        return IconButton(
                          icon: Icon(Icons.play_arrow),
                          iconSize: 64.0,
                          color:Colors.white,
                          onPressed: player.play,
                        );
                      } else if (processingState != ProcessingState.completed) {
                        return IconButton(
                          icon: Icon(Icons.pause),
                          color:Colors.white,
                          iconSize: 64.0,
                          onPressed: player.pause,
                        );
                      } else {
                        return IconButton(
                          icon: Icon(Icons.replay),
                          iconSize: 64.0,
                          onPressed: () => player.seek(Duration.zero),
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(bottom:30),
                  child: StreamBuilder<PositionData>(
                    stream: _positionDataStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data;
                      return SeekBar(
                        duration: positionData?.duration ?? Duration.zero,
                        position: positionData?.position ?? Duration.zero,
                        bufferedPosition:
                        positionData?.bufferedPosition ?? Duration.zero,
                        onChangeEnd: player.seek,
                      );
                    },
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    ),);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
