import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../custom/custom_widgets.dart';
import '../../../functions/functions.dart';
import '../../main_page.dart';
import '../../player/player.dart';
import '../../search/search.dart';
import '../../theme.dart';
import 'list_builder_music.dart';

class Musics extends StatefulWidget {
  const Musics({Key? key}) : super(key: key);
  static dynamic selectedindex;
  static List<dynamic> songslist = [];
  static SongSortType? sorttype = SortFunctions.sortfunction(2);
  @override
  State<Musics> createState() => _MusicsState();
}

class _MusicsState extends State<Musics> {
  @override
  void initState() {
    super.initState();
    PlayerFunctions.player.currentIndexStream.listen((index) {
      if (index != null) {
        setState(() {
          MainPage.selectedid =
              MainPage.songslist[PlayerFunctions.player.currentIndex!].id;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    FavouritesData.showsongs();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Color.fromARGB(255, 185, 57, 136),
              Color.fromARGB(43, 255, 255, 255),
              Color.fromARGB(0, 109, 109, 109)
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const SearchScreen())));
                    },
                    icon: Icon(
                      Icons.search_outlined,
                      color: Themecolors.fontColor ?? Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    )),
                Text(
                  'Music',
                  style: TextStyle(
                      color: Themecolors.fontColor ?? Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () async {
                      await Future.delayed(
                          const Duration(milliseconds: 10),
                          () => CustomWidgets.sort(context).whenComplete(() {
                                setState(() {});
                              }));
                      //CustomWidgets.sort(context);
                    },
                    icon: Icon(
                      Icons.sort,
                      color: Themecolors.fontColor ?? Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.04),
                child: FutureBuilder<List<SongModel>>(
                  future: OnAudioFunctons.audioQuery.querySongs(
                      sortType: Musics.sorttype,
                      orderType: OrderType.ASC_OR_SMALLER,
                      uriType: UriType.EXTERNAL,
                      ignoreCase: true),
                  builder: (context, item) {
                    Musics.songslist.clear();
                    Musics.songslist.addAll(item.data ?? []);
                    if (item.data == null) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Themecolors.fontColor ?? Colors.white,
                          strokeWidth: 10,
                        ),
                      );
                    } else if (item.data!.isEmpty) {
                      return Center(
                          child: Text('No musics found',
                              style: TextStyle(
                                  color: Themecolors.fontColor ?? Colors.white,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w900)));
                    }
                    return ListView.builder(
                      itemCount: item.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                            child: MusicListBuilder(index: index, item: item),
                            onTap: () {
                              if (item.data![index].id == MainPage.selectedid) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PlayerScreen(
                                        item: MainPage.songslist,
                                        index: PlayerFunctions
                                            .player.currentIndex)));
                              } else {
                                MainPage.selectedid = item.data![index].id;
                                MainPage.songslist = item.data!;
                                PlayerFunctions.play(
                                    item.data!.toList(), index);
                              }
                            });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
