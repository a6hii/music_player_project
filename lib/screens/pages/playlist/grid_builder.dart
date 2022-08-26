import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player_project/custom/delete_dialog.dart';

import '../../../model/playlist_functions.dart';
import '../../theme.dart';

//*returning model tile
class GridBuilder extends StatefulWidget {
  const GridBuilder({Key? key, required this.index, required this.image})
      : super(key: key);
  final dynamic index;
  final dynamic image;

  @override
  State<GridBuilder> createState() => _GridBuilderState();
}

class _GridBuilderState extends State<GridBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.image != '') {
      return Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: MemoryImage(const Base64Decoder()
                          .convert(widget.image.toString()))),
                  color: const Color.fromARGB(255, 226, 45, 45),
                  borderRadius: BorderRadius.circular(17.r)),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.topRight,
                            onPressed: () async {
                              final shouldDelete =
                                  await showDeleteDialog(context);
                              if (shouldDelete) {
                                PlayListFunctions.deleteplaylist(widget.index);
                                Future.delayed(Duration.zero, () {
                                  Navigator.of(context).pop();
                                });
                              } else {
                                Future.delayed(Duration.zero, () {
                                  Navigator.of(context).pop();
                                });
                              }
                              // showDialog(
                              //     context: context,
                              //     builder: (BuildContext context) {
                              //       return AlertDialog(
                              //         insetPadding: EdgeInsets.zero,
                              //         actions: [
                              //           InkWell(
                              //               onTap: () {
                              //                 Navigator.of(context).pop();
                              //               },
                              //               child: const Icon(
                              //                 Icons.cancel,
                              //                 color: Colors.white,
                              //               )),
                              //           InkWell(
                              //               onTap: () {
                              //                 PlayListFunctions.deleteplaylist(
                              //                     widget.index);
                              //                 Navigator.of(context).pop();
                              //               },
                              //               child: const Icon(
                              //                 Icons.delete,
                              //                 color: Colors.white,
                              //               ))
                              //         ],
                              //         backgroundColor:
                              //             Color.fromARGB(255, 36, 36, 36),
                              //         title:
                              //             const Text('Delete this playlist?'),
                              //         titleTextStyle: const TextStyle(
                              //             fontWeight: FontWeight.w900,
                              //             color: Colors.white),
                              //       );
                              //     });
                            },
                            icon: Icon(
                              Icons.delete,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              shadows: [
                                Shadow(
                                    color: Colors.black,
                                    offset: Offset.fromDirection(1, 3.5),
                                    blurRadius: 2)
                              ],
                            )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02)
                      ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(PlayListFunctions.playlists.value[widget.index].name,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Themecolors.fontColor ?? Colors.white)),
          )
        ],
      );
    }
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('lib/assets/images/IMG_0007.JPG'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(17.r)),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.topRight,
                        // onTap: () {
                        //   showDialog(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return AlertDialog(
                        //           actions: [
                        //             InkWell(
                        //                 onTap: () {
                        //                   Navigator.of(context).pop();
                        //                 },
                        //                 child: const Icon(
                        //                   Icons.cancel,
                        //                   color: Colors.white,
                        //                 )),
                        //             InkWell(
                        //                 onTap: () {
                        //                   PlayListFunctions.deleteplaylist(
                        //                       widget.index);
                        //                   Navigator.of(context).pop();
                        //                 },
                        //                 child: const Icon(
                        //                   Icons.delete,
                        //                   color: Colors.white,
                        //                 ))
                        //           ],
                        //           backgroundColor:
                        //               const Color.fromARGB(73, 255, 255, 255),
                        //           title: const Text('Do you want delete ?'),
                        //           titleTextStyle: const TextStyle(
                        //               fontWeight: FontWeight.w900,
                        //               color: Colors.white),
                        //         );
                        //       });
                        // },
                        onPressed: () async {
                          final shouldDelete = await showDeleteDialog(context);
                          if (shouldDelete) {
                            PlayListFunctions.deleteplaylist(widget.index);
                            // Future.delayed(Duration.zero, () {
                            //   Navigator.of(context).pop();
                            // });
                          }
                          // else {
                          //   Future.delayed(Duration.zero, () {
                          //     Navigator.of(context).pop();
                          //   });
                          // }
                        },
                        icon: Icon(
                          Icons.delete,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset.fromDirection(1, 3.5),
                                blurRadius: 2)
                          ],
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02)
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(PlayListFunctions.playlists.value[widget.index].name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Themecolors.fontColor ?? Colors.white)),
        )
      ],
    );
  }
}
