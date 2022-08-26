import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../functions/functions.dart';
import '../../theme.dart';

class Shuffle extends StatefulWidget {
  const Shuffle({Key? key}) : super(key: key);

  @override
  State<Shuffle> createState() => _ShuffleState();
}

class _ShuffleState extends State<Shuffle> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        PlayerFunctions.player.shuffleModeEnabled == true
            ? PlayerFunctions.player.setShuffleModeEnabled(false)
            : PlayerFunctions.player.setShuffleModeEnabled(true);
      },
      icon: StreamBuilder(
        stream: PlayerFunctions.player.shuffleModeEnabledStream,
        builder: (context, snapshot) {
          final shuffleMode = snapshot.data;
          if (shuffleMode == true) {
            return Icon(
              Icons.shuffle,
              color: Themecolors.fontColor ??
                  const Color.fromARGB(255, 77, 218, 119),
              size: 25.sp,
            );
          }
          return Icon(
            Icons.shuffle,
            color: Themecolors.fontColor ?? Colors.white,
            size: 25.sp,
          );
        },
      ),
    );
  }
}
