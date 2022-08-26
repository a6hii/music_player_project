import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash_screen.dart';

class Themecolors {
  static bool? returnvalue;
  static Color? fontColor;
  static Color? background;
  static Color? transout;
  static Color? transin;
  static Color? themechoose;
  static Color? progress;
  static Brightness? enumcolor;

  static greytone() {
    enumcolor = Brightness.dark;
    fontColor = Colors.black;
    background = Colors.grey;
    transin = const Color.fromARGB(149, 255, 255, 255);
    transout = const Color.fromARGB(148, 0, 0, 0);
    progress = const Color.fromARGB(98, 0, 0, 0);
  }

  static navybluetone() {
    enumcolor = Brightness.light;
    fontColor = null;
    background = null;
    transin = null;
    transout = null;
    progress = null;
  }

  static blacktone() {
    enumcolor = Brightness.light;
    fontColor = null;
    background = Colors.black;
    transin = null;
    transout = null;
    progress = null;
  }

  static whitetone() {
    enumcolor = Brightness.dark;
    fontColor = Colors.black;
    background = Colors.white;
    transout = const Color.fromARGB(148, 0, 0, 0);
    transin = const Color.fromARGB(148, 0, 0, 0);
    progress = const Color.fromARGB(148, 0, 0, 0);
  }

  static pinktone() {
    enumcolor = Brightness.light;
    fontColor = Colors.black;
    background = Colors.pink[200];
    transin = const Color.fromARGB(149, 255, 255, 255);
    transout = const Color.fromARGB(148, 0, 0, 0);
    progress = const Color.fromARGB(97, 255, 255, 255);
  }

  static greentone() {
    enumcolor = Brightness.light;
    fontColor = Colors.black;
    background = Colors.green[600];
    transin = const Color.fromARGB(149, 255, 255, 255);
    transout = const Color.fromARGB(148, 0, 0, 0);
    progress = const Color.fromARGB(97, 255, 255, 255);
  }

  static themeselection(context) {
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
          //use Container>Column>Buttons
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      addvalue(1);
                      Themecolors.settheme();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      'Grey Tone',
                      style:
                          TextStyle(color: Color.fromARGB(255, 233, 233, 233)),
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
                      addvalue(2);
                      Themecolors.settheme();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      'White Tone',
                      style:
                          TextStyle(color: Color.fromARGB(255, 233, 233, 233)),
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
                      addvalue(3);
                      Themecolors.settheme();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      'Black Tone',
                      style:
                          TextStyle(color: Color.fromARGB(255, 233, 233, 233)),
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
                      addvalue(0);
                      Themecolors.settheme();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      'NavyBlue Tone',
                      style:
                          TextStyle(color: Color.fromARGB(255, 233, 233, 233)),
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
                      addvalue(4);
                      Themecolors.settheme();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      'Pink Tone',
                      style:
                          TextStyle(color: Color.fromARGB(255, 233, 233, 233)),
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
                      addvalue(5);
                      Themecolors.settheme();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SplashScreen()),
                          (route) => false);
                    },
                    child: const Text(
                      'Green Tone',
                      style:
                          TextStyle(color: Color.fromARGB(255, 233, 233, 233)),
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
                      style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                    ),
                  ),
                ]),
          );
        });
  }

  static settheme() async {
    final themePrefs = await SharedPreferences.getInstance();
    final value = themePrefs.getInt('themeprefs');
    switch (value) {
      case 1:
        Themecolors.greytone();
        break;
      case 2:
        Themecolors.whitetone();
        break;
      case 3:
        Themecolors.blacktone();
        break;
      case 4:
        Themecolors.pinktone();
        break;
      case 5:
        Themecolors.greentone();
        break;
      default:
        Themecolors.navybluetone();
    }
  }

  static addvalue(value) async {
    final themePrefs = await SharedPreferences.getInstance();
    themePrefs.setInt('themeprefs', value);
  }
}
