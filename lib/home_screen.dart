import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donloader_demo/media_list_model.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Duration duration = Duration();
  Duration position = Duration();
  AudioPlayer audioPlayer = AudioPlayer();
  int result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  initPlayer() {
    audioPlayer.durationHandler = (d) => setState(() {
          duration = d;
        });
    audioPlayer.positionHandler = (p) => setState(() {
          position = p;
        });
  }

  @override
  Widget build(BuildContext context) {
    Get.printInfo(info: 'Current page --> $runtimeType');
    Get.printInfo(info: 'Duration --> $duration');
    Get.printInfo(info: 'Position --> $position');
    return WillPopScope(
      onWillPop: () async {
        await audioPlayer.pause();
        for (int i = 0; i < audiolist.length; i++) {
          audiolist[i].playingstatus = 0;
        }
        Get.back();

        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Flutter Downloader'), centerTitle: true),
        body: SingleChildScrollView(
          primary: true,
          child: Column(
            children: [
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  MediaListModel data = audiolist[index];
                  return InkWell(
                    onTap: () async {
                      if (audiolist[index].playingstatus == 0) {
                        result = await audioPlayer.stop();
                        result = await audioPlayer.play(audiolist[index].path,
                            isLocal: true);
                        Get.printInfo(info: 'Playing --> ${data.path}');
                        setState(() {
                          for (int i = 0; i < audiolist.length; i++) {
                            audiolist[i].playingstatus = 0;
                          }
                          audiolist[index].playingstatus = 1;
                        });
                        Get.snackbar(
                          '${data.fileName}',
                          'We playing ${data.path}',
                          snackPosition: SnackPosition.BOTTOM,
                          icon: Icon(Icons.music_note),
                          borderRadius: 20,
                          margin: EdgeInsets.all(15),
                          duration: Duration(seconds: 3),
                        );
                      } else if (audiolist[index].playingstatus == 1) {
                        result = await audioPlayer.stop();
                        setState(() {
                          for (int i = 0; i < audiolist.length; i++) {
                            audiolist[i].playingstatus = 0;
                          }
                        });
                      }
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Container(
                        color: Colors.blueGrey,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('${data.fileName}',
                                      style: TextStyle(color: Colors.white)),
                                  Spacer(),
                                  Icon(Icons.file_download),
                                ],
                              ),
                              audiolist[index].playingstatus == 0
                                  ? Container()
                                  : slider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: audiolist.length ?? 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  seekToSecond(int time) {
    Duration newDuration = Duration(microseconds: time);
    audioPlayer.seek(newDuration);
  }

  Widget slider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.red[700],
        inactiveTrackColor: Colors.red[100],
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        thumbColor: Colors.redAccent,
      ),
      child: Slider(
        value: position.inMicroseconds.toDouble(),
        min: 0.0,
        max: duration.inMicroseconds.toDouble(),
        label: '${position.inMicroseconds.toDouble()}',
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        },
      ),
    );
  }
}
