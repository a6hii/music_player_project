import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../functions/functions.dart';
import '../model/playlist_model.dart';
import '../screens/pages/musics/musics.dart';
import '../screens/splash_screen.dart';
import '../screens/theme.dart';

class CustomWidgets {
  static more(context, index, item) {
    final check = FavouritesData.favids.contains(item[index]
        .id); //musicsList index is getting passed instead of playlists's index
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
        builder: (context) {
          return Container(
            height: 200,
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: () {
                      if (check == false) {
                        FavouritesData.addSong(songid: item[index].id);
                        Navigator.of(context).pop();
                      } else {
                        final checkindex = FavouritesData.favids
                            .indexWhere((element) => element == item[index].id);
                        FavouritesData.deletesong(checkindex);
                        Navigator.of(context).pop();
                      }
                    },
                    child: (check == false)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Add to fav   ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              Icon(
                                Icons.favorite_outline_rounded,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Remove from fav   ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              Icon(
                                Icons.favorite_rounded,
                                color: Color.fromARGB(255, 243, 33, 33),
                              )
                            ],
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Divider(
                      color: Colors.grey[350],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      details(context, index, item);
                    },
                    child: const Text(
                      'Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Divider(
                      color: Colors.grey[350],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  )
                ]),
          );
          // return CupertinoActionSheet(
          //   actions: <CupertinoActionSheetAction>[
          //     CupertinoActionSheetAction(onPressed: () {

          //     }, child: Builder(builder: (context) {

          //     })),
          //     CupertinoActionSheetAction(
          //       onPressed: () {
          //
          //       },
          //       child:
          //     ),
          //     CupertinoActionSheetAction(
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //       child: const Text('Close'),
          //     )
          //   ],
          // );
        });
  }

  static details(context, index, item) {
    final size = filesize(item[index].size);

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
        builder: (context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black),
                      height: 4,
                      width: 160,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: 'Title : ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: item[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Album : ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: item[index].album,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Composor : ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: item[index].composer,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Track : ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: item[index].track.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Artist : ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: item[index].artist,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Path : ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: item[index].data.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Size : ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: size,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Extension : ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: item[index].fileExtension,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  static sort(context) {
    return showModalBottomSheet(
        enableDrag: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    MediaQuery.of(context).size.aspectRatio * 60),
                topRight: Radius.circular(
                    MediaQuery.of(context).size.aspectRatio * 60))),
        backgroundColor: const Color.fromARGB(255, 9, 19, 33),
        context: context,
        builder: (context) {
          return Container(
              height: 280,
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    const SizedBox(
                      height: 14,
                    ),
                    TextButton(
                        onPressed: () {
                          Musics.sorttype = SortFunctions.sortfunction(1);
                          Navigator.of(context).pop();
                        },
                        child: Musics.sorttype != SortFunctions.sortfunction(1)
                            ? const Text(
                                'Sort by DateModified',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              )
                            : const Text(
                                'Sort by DateModified',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18),
                              )),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Divider(
                        color: Colors.grey[350],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Musics.sorttype = SortFunctions.sortfunction(2);
                          Navigator.of(context).pop();
                        },
                        child: Musics.sorttype != SortFunctions.sortfunction(2)
                            ? const Text(
                                'Sort by Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              )
                            : const Text(
                                'Sort by Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              )),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Divider(
                        color: Colors.grey[350],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Musics.sorttype = SortFunctions.sortfunction(3);
                          Navigator.of(context).pop();
                        },
                        child: Musics.sorttype != SortFunctions.sortfunction(3)
                            ? const Text(
                                'Sort by Size',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              )
                            : const Text(
                                'Sort by Size',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              )),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Divider(
                        color: Colors.grey[350],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Close',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    )
                  ]));
        });
    // return showModalBottomSheet(
    //     context: context,
    //     builder: (context) {
    //       return CupertinoActionSheet(actions: <CupertinoActionSheetAction>[
    //         CupertinoActionSheetAction(
    //           onPressed: () {
    //
    //           },
    //           child: Builder(builder: (context) {
    //
    //           }),
    //         ),
    //         CupertinoActionSheetAction(onPressed: () {

    //         }, child: Builder(builder: (context) {

    //         })),
    //         CupertinoActionSheetAction(onPressed: () {

    //         }, child: Builder(builder: (context) {
    //
    //         })),
    //         CupertinoActionSheetAction(
    //           onPressed: () {

    //           },
    //           child: const Text('Close'),
    //         )
    //       ]);
    //     });
  }

  static reset(context) {
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
        builder: (context) {
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding:
                                  const EdgeInsets.fromLTRB(24, 24, 24, 8),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              content: const Text('Are you sure?',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    resetapp();
                                    Themecolors.addvalue(0);
                                    Themecolors.navybluetone();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SplashScreen()),
                                        (route) => false);
                                  },
                                  child: const Text(
                                    'Reset',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              title: const Text(
                                'Do you want Reset the App?',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              titleTextStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            );
                          });
                    },
                    child: const Text(
                      'Reset entire App',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Divider(
                      color: Colors.grey[350],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding:
                                  const EdgeInsets.fromLTRB(24, 24, 24, 8),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              content: const Text('Are you sure?',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      resetfavourite();
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SplashScreen()),
                                          (route) => false);
                                    },
                                    child: const Text(
                                      'Reset',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                      ),
                                    ))
                              ],
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              title: const Text(
                                'Do you want Reset Favourite ?',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              titleTextStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            );
                          });
                    },
                    child: const Text(
                      'Reset Favourite',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Divider(
                      color: Colors.grey[350],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding:
                                  const EdgeInsets.fromLTRB(24, 24, 24, 8),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              content: const Text('Are you sure?',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      resetplaylist();
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SplashScreen()),
                                          (route) => false);
                                    },
                                    child: const Text(
                                      'Reset',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                      ),
                                    ))
                              ],
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              title: const Text(
                                'Do you want Reset PlayList?',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              titleTextStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            );
                          });
                    },
                    child: const Text(
                      'Reset PlayList',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Divider(
                      color: Colors.grey[350],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding:
                                  const EdgeInsets.fromLTRB(24, 24, 24, 8),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              content: const Text('Are you sure?',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    resettheme();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SplashScreen()),
                                        (route) => false);
                                  },
                                  child: const Text(
                                    'Reset',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              title: const Text(
                                'Do you want Reset Theme?',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              titleTextStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            );
                          });
                    },
                    child: const Text(
                      'Reset Theme',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Divider(
                      color: Colors.grey[350],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  )
                ]),
          );
        });
    // return CupertinoActionSheet(
    //   actions: <CupertinoActionSheetAction>[
    //     CupertinoActionSheetAction(
    //       onPressed: () {
    //         showDialog(
    //             context: context,
    //             builder: (BuildContext context) {
    //               return AlertDialog(
    //                 actions: [
    //                   InkWell(
    //                       onTap: () {
    //                         Navigator.of(context).pop();
    //                       },
    //                       child: const Icon(
    //                         Icons.cancel,
    //                         color: Colors.white,
    //                       )),
    //                   InkWell(
    //                       onTap: () {
    //                         resetapp();
    //                         Themecolors.addvalue(0);
    //                         Themecolors.navybluetone();
    //                         Navigator.of(context).pushAndRemoveUntil(
    //                             MaterialPageRoute(
    //                                 builder: (context) => const SplashScreen()),
    //                             (route) => false);
    //                       },
    //                       child: const Icon(
    //                         Icons.restart_alt,
    //                         color: Colors.white,
    //                       ))
    //                 ],
    //                 backgroundColor: const Color.fromARGB(73, 255, 255, 255),
    //                 title: const Text('Do you want Reset entire App?'),
    //                 titleTextStyle: const TextStyle(
    //                     fontWeight: FontWeight.w900, color: Colors.white),
    //               );
    //             });
    //       },
    //       child: const Text('Reset entire App'),
    //     ),
    //     CupertinoActionSheetAction(
    //       onPressed: () {
    //         showDialog(
    //             context: context,
    //             builder: (BuildContext context) {
    //               return AlertDialog(
    //                 actions: [
    //                   InkWell(
    //                       onTap: () {
    //                         Navigator.of(context).pop();
    //                       },
    //                       child: const Icon(
    //                         Icons.cancel,
    //                         color: Colors.white,
    //                       )),
    //                   InkWell(
    //                       onTap: () {
    //                         resetfavourite();
    //                         Navigator.of(context).pushAndRemoveUntil(
    //                             MaterialPageRoute(
    //                                 builder: (context) => const SplashScreen()),
    //                             (route) => false);
    //                       },
    //                       child: const Icon(
    //                         Icons.restart_alt,
    //                         color: Colors.white,
    //                       ))
    //                 ],
    //                 backgroundColor: const Color.fromARGB(73, 255, 255, 255),
    //                 title: const Text('Do you want Reset Favourite ?'),
    //                 titleTextStyle: const TextStyle(
    //                     fontWeight: FontWeight.w900, color: Colors.white),
    //               );
    //             });
    //       },
    //       child: const Text('Reset Favourite'),
    //     ),
    //     CupertinoActionSheetAction(
    //       onPressed: () {
    //         showDialog(
    //             context: context,
    //             builder: (BuildContext context) {
    //               return AlertDialog(
    //                 actions: [
    //                   InkWell(
    //                       onTap: () {
    //                         Navigator.of(context).pop();
    //                       },
    //                       child: const Icon(
    //                         Icons.cancel,
    //                         color: Colors.white,
    //                       )),
    //                   InkWell(
    //                       onTap: () {
    //                         resetplaylist();
    //                         Navigator.of(context).pushAndRemoveUntil(
    //                             MaterialPageRoute(
    //                                 builder: (context) => const SplashScreen()),
    //                             (route) => false);
    //                       },
    //                       child: const Icon(
    //                         Icons.restart_alt,
    //                         color: Colors.white,
    //                       ))
    //                 ],
    //                 backgroundColor: const Color.fromARGB(73, 255, 255, 255),
    //                 title: const Text('Do you want Reset PlayList?'),
    //                 titleTextStyle: const TextStyle(
    //                     fontWeight: FontWeight.w900, color: Colors.white),
    //               );
    //             });
    //       },
    //       child: const Text('Reset PlayList'),
    //     ),
    //     CupertinoActionSheetAction(
    //       onPressed: () {
    //         showDialog(
    //             context: context,
    //             builder: (BuildContext context) {
    //               return AlertDialog(
    //                 actions: [
    //                   InkWell(
    //                       onTap: () {
    //                         Navigator.of(context).pop();
    //                       },
    //                       child: const Icon(
    //                         Icons.cancel,
    //                         color: Colors.white,
    //                       )),
    //                   InkWell(
    //                       onTap: () {
    //                         resettheme();
    //                         Navigator.of(context).pushAndRemoveUntil(
    //                             MaterialPageRoute(
    //                                 builder: (context) => const SplashScreen()),
    //                             (route) => false);
    //                       },
    //                       child: const Icon(
    //                         Icons.restart_alt,
    //                         color: Colors.white,
    //                       ))
    //                 ],
    //                 backgroundColor: const Color.fromARGB(73, 255, 255, 255),
    //                 title: const Text('Do you want Reset Theme?'),
    //                 titleTextStyle: const TextStyle(
    //                     fontWeight: FontWeight.w900, color: Colors.white),
    //               );
    //             });
    //       },
    //       child: const Text('Reset Theme'),
    //     ),
    //     CupertinoActionSheetAction(
    //       onPressed: () {
    //         Navigator.of(context).pop();
    //       },
    //       child: const Text('Close'),
    //     )
    //   ],
    // );
  }

  static resetapp() async {
    final favdb = await Hive.openBox('favBox');
    final playlistdb = await Hive.openBox<PlaylistModel>('playlists');
    final playlisids = await Hive.openBox<dynamic>('playlistids');
    await PlayerFunctions.player.stop();
    await favdb.clear();
    await playlisids.clear();
    await playlistdb.clear();
  }

  static resetfavourite() async {
    final favdb = await Hive.openBox('favBox');
    await favdb.clear();
  }

  static resetplaylist() async {
    final playlistdb = await Hive.openBox<PlaylistModel>('playlists');
    final playlisids = await Hive.openBox<dynamic>('playlistids');
    await playlisids.clear();
    await playlistdb.clear();
  }

  static resettheme() {
    Themecolors.addvalue(0);
    Themecolors.navybluetone();
  }
}
