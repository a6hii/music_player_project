import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../model/playlist_functions.dart';
import '../../../theme.dart';
import 'add_or_remove.dart';

class AddToPlayList extends StatefulWidget {
  const AddToPlayList({Key? key}) : super(key: key);

  @override
  State<AddToPlayList> createState() => _AddToPlayListState();
}

class _AddToPlayListState extends State<AddToPlayList> {
  @override
  Widget build(BuildContext context) {
    PlayListFunctions.showplaylist();
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            enableDrag: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        MediaQuery.of(context).size.aspectRatio * 60),
                    topRight: Radius.circular(
                        MediaQuery.of(context).size.aspectRatio * 60))),
            backgroundColor: const Color.fromARGB(255, 9, 19, 33),
            context: context,
            builder: (BuildContext context) {
              if (PlayListFunctions.playlists.value.isEmpty) {
                return Container(
                  height: 240,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          //Color.fromARGB(255, 185, 57, 136),
                          Color.fromARGB(78, 255, 255, 255),
                          Color.fromARGB(28, 109, 109, 109)
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.r),
                          topRight: Radius.circular(30.r))),
                  child: Center(
                      child: Text('Create PlayList',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.aspectRatio * 50,
                              fontWeight: FontWeight.w900))),
                );
              }
              return Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //Color.fromARGB(255, 185, 57, 136),
                        Color.fromARGB(78, 255, 255, 255),
                        Color.fromARGB(28, 109, 109, 109)
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.black),
                        height: 4,
                        width: 160,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //SizedBox(height: 30.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: PlayListFunctions.playlists.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: SizedBox(
                              height: 70.h,
                              child: ListTile(
                                  title: Text(
                                    PlayListFunctions
                                        .playlists.value[index].name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.r),
                                    child: Builder(builder: (context) {
                                      if (PlayListFunctions
                                              .playlists.value[index].image !=
                                          '') {
                                        return Image.memory(
                                            const Base64Decoder().convert(
                                                PlayListFunctions.playlists
                                                    .value[index].image
                                                    .toString()));
                                      } else {
                                        return Image.asset(
                                          'lib/assets/images/IMG_0007.JPG',
                                          fit: BoxFit.cover,
                                        );
                                      }
                                    }),
                                  ),
                                  trailing: PlayerPlayListAddRemoveButton(
                                      index: index)),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        icon: Icon(Icons.playlist_add,
            color: Themecolors.fontColor ?? Colors.white, size: 25.sp));
  }
}
