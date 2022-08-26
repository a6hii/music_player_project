// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../functions/functions.dart';
import '../main_page.dart';
import '../player/controllers/play_pause.dart';
import '../player/controllers/progressbar.dart';
import '../theme.dart';

class MiniPLayerScreen extends StatefulWidget {
  const MiniPLayerScreen({Key? key}) : super(key: key);
  @override
  State<MiniPLayerScreen> createState() => _MiniPLayerScreenState();
}

class _MiniPLayerScreenState extends State<MiniPLayerScreen> {
  @override
  void initState() {
    super.initState();
    OnAudioFunctons.requestPermission();
    PlayerFunctions.player.currentIndexStream.listen((index) {
      if (index != null) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        // margin:
        //     const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color.fromARGB(255, 15, 15, 15),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Color.fromARGB(255, 29, 29, 29),
          //     offset: Offset(0.0, 1.0), //(x,y)
          //     blurRadius: 6.0,
          //   ),
          // ],
        ),

        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(8),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    MainPage.songslist[PlayerFunctions.player.currentIndex!]
                                .title.length >
                            16
                        ? '${MainPage.songslist[PlayerFunctions.player.currentIndex!].title.substring(0, 16)}...'
                        : MainPage
                            .songslist[PlayerFunctions.player.currentIndex!]
                            .title,
                    style: TextStyle(
                        color: Themecolors.fontColor ?? Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                      MainPage.songslist[PlayerFunctions.player.currentIndex!]
                                  .artist!.length >
                              8
                          ? '${MainPage.songslist[PlayerFunctions.player.currentIndex!].artist!.substring(0, 8)}...'
                          : MainPage
                                  .songslist[
                                      PlayerFunctions.player.currentIndex!]
                                  .artist ??
                              'No Artist',
                      style: TextStyle(
                          color: Themecolors.fontColor ??
                              const Color.fromARGB(206, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                          fontSize: 14))
                ],
              ),
              trailing: PlayAndPause(
                buttonsize: 50.sp,
                buttoncolor: Themecolors.fontColor ?? Colors.white,
              ),
              leading: QueryArtworkWidget(
                  artworkBorder: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.03),
                  id: MainPage
                      .songslist[PlayerFunctions.player.currentIndex!].id,
                  type: ArtworkType.AUDIO),
            ),
            const ProgressBarscreen(thumbRadius: 0, fontsize: 0)
          ],
        ),
      ),
    );
  }
}
