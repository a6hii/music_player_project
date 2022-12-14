import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../model/playlist_functions.dart';
import '../../../../model/playlist_model.dart';
import '../../musics/musics.dart';
import 'add_list_builder.dart';

class BottomSheetContents extends StatefulWidget {
  const BottomSheetContents({Key? key}) : super(key: key);
  static List<dynamic> selectedsongs = [];
  @override
  State<BottomSheetContents> createState() => _BottomSheetContentsState();
}

class _BottomSheetContentsState extends State<BottomSheetContents> {
  final _playlistname = TextEditingController();
  String image = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Container(
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: TextField(
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 233, 233, 233),
                                        fontWeight: FontWeight.w900),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(
                                              MediaQuery.of(context)
                                                      .size
                                                      .aspectRatio *
                                                  40)),
                                      fillColor:
                                          const Color.fromARGB(255, 0, 0, 0),
                                      filled: true,
                                      hintText: 'Playlist Name',
                                      hintStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              166, 255, 255, 255),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    controller: _playlistname,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      addImage();
                                    },
                                    icon: Icon(
                                      Icons.add_a_photo,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      size: MediaQuery.of(context)
                                              .size
                                              .aspectRatio *
                                          80,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      saveplaylist(context);
                                    },
                                    icon: Icon(
                                      Icons.done_rounded,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      size: MediaQuery.of(context)
                                              .size
                                              .aspectRatio *
                                          80,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Expanded(child: Builder(
                              builder: (context) {
                                if (Musics.songslist.isEmpty) {
                                  return Center(
                                      child: Text('No musics found',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 23.sp,
                                              fontWeight: FontWeight.w900)));
                                }
                                return ListView.builder(
                                  itemCount: Musics.songslist.isEmpty
                                      ? 1
                                      : Musics.songslist.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return AddPlayListTile(index: index);
                                  },
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }

  saveplaylist(context) async {
    final name = _playlistname.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(
                  MediaQuery.of(context).size.aspectRatio * 20))),
          content: const Text('Enter playlist name',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w900))));
    } else {
      final model = PlaylistModel(
          name: name,
          playlists: BottomSheetContents.selectedsongs,
          image: image);
      await PlayListFunctions.addPlaylist(
        model: model,
      );
      BottomSheetContents.selectedsongs.clear();
      _playlistname.clear();
      Navigator.of(context).pop();
    }
  }

  addImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagepick =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagepick == null) {
      return;
    } else {
      final bytes = File(imagepick.path).readAsBytesSync();
      image = base64Encode(bytes);
      setState(() {});
    }
  }
}
