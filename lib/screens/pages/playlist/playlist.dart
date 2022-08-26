import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player_project/screens/playlist_songlist_screen/playlist.dart';

import '../../../model/playlist_functions.dart';

import '../../search/search.dart';
import '../../theme.dart';
import 'addplaylist/add_details.dart';
import 'grid_builder.dart';

class PlayLists extends StatefulWidget {
  const PlayLists({Key? key}) : super(key: key);
  @override
  State<PlayLists> createState() => _PlayListsState();
}

class _PlayListsState extends State<PlayLists> {
  @override
  Widget build(BuildContext context) {
    PlayListFunctions.showplaylist();
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const SearchScreen())));
                      },
                      icon: Icon(
                        Icons.search_outlined,
                        color: Themecolors.fontColor ?? Colors.white,
                        size: MediaQuery.of(context).size.width * 0.08,
                      )),
                ),
                Text(
                  'Your Playlists',
                  style: TextStyle(
                      color: Themecolors.fontColor ?? Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        enableDrag: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    MediaQuery.of(context).size.aspectRatio *
                                        60),
                                topRight: Radius.circular(
                                    MediaQuery.of(context).size.aspectRatio *
                                        60))),
                        backgroundColor: const Color.fromARGB(255, 9, 19, 33),
                        context: context,
                        builder: (BuildContext context) {
                          return const BottomSheetContents();
                        },
                      );
                    },
                    icon: Icon(
                      Icons.playlist_add,
                      color: Themecolors.fontColor ?? Colors.white,
                      size: MediaQuery.of(context).size.width * 0.08,
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17.r),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ValueListenableBuilder(
                    valueListenable: PlayListFunctions.playlists,
                    builder:
                        (BuildContext context, dynamic value, Widget? child) {
                      if (PlayListFunctions.playlists.value.isEmpty) {
                        return Center(
                            child: Text('Add PLayList',
                                style: TextStyle(
                                    color:
                                        Themecolors.fontColor ?? Colors.white,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w900)));
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            childAspectRatio:
                                MediaQuery.of(context).size.aspectRatio * 1.6,
                            mainAxisSpacing: 10),
                        itemCount: PlayListFunctions.playlists.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PlayListScreen(
                                        playlistname: PlayListFunctions
                                            .playlists.value[index].name,
                                        index: index)));
                              },
                              child: GridBuilder(
                                index: index,
                                image: PlayListFunctions
                                    .playlists.value[index].image,
                              ));
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
