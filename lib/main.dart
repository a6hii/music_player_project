import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_audio_background/just_audio_background.dart';

import 'functions/functions.dart';
import 'model/playlist_model.dart';
import 'screens/splash_screen.dart';
import 'screens/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(PlaylistModelAdapter().typeId)) {
    Hive.registerAdapter(PlaylistModelAdapter());
  }

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  await Themecolors.settheme();
  await OnAudioFunctons.requestPermission();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
      designSize: const Size(392.72727272727275, 802.9090909090909),
    );
  }
}
