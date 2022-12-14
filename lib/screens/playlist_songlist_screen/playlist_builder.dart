import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../custom/custom_widgets.dart';
import '../main_page.dart';
import '../pages/musics/musics.dart';
import '../theme.dart';

class PlayListSongTile extends StatelessWidget {
  const PlayListSongTile({Key? key, required this.index, required this.item})
      : super(key: key);
  final dynamic index;
  final dynamic item;
  @override
  Widget build(BuildContext context) {
    if (Musics.songslist[index].id == MainPage.selectedid) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.aspectRatio * 30),
          child: ColoredBox(
            color:
                Themecolors.transin ?? const Color.fromARGB(104, 255, 255, 255),
            child: ListTile(
              title: Text(
                Musics.songslist[index].title.length > 17
                    ? Musics.songslist[index].title.substring(0, 17) + '...'
                    : Musics.songslist[index].title,
                style: TextStyle(
                    color: Themecolors.fontColor ?? Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              subtitle: Text(
                Musics.songslist[index].artist.length > 17
                    ? Musics.songslist[index].artist.substring(0, 17) + '...'
                    : Musics.songslist[index].artist ?? 'No Artist',
                style: TextStyle(
                    color: Themecolors.fontColor ?? Colors.white,
                    fontWeight: FontWeight.w900),
              ),
              leading: QueryArtworkWidget(
                  artworkBorder: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.03),
                  id: Musics.songslist[index].id,
                  type: ArtworkType.AUDIO),
              trailing: InkWell(
                onTap: () {
                  CustomWidgets.more(context, index, item);
                },
                child: Icon(Icons.more_vert,
                    color: Themecolors.fontColor ?? Colors.white, size: 40.sp),
              ),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.02),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
          child: ListTile(
            title: Text(
              Musics.songslist[index].title.length > 17
                  ? Musics.songslist[index].title.substring(0, 17) + '...'
                  : Musics.songslist[index].title,
              style: TextStyle(
                  color: Themecolors.fontColor ?? Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            subtitle: Text(
              Musics.songslist[index].artist.length > 17
                  ? Musics.songslist[index].artist.substring(0, 17) + '...'
                  : Musics.songslist[index].artist ?? 'No Artist',
              style: TextStyle(
                  color: Themecolors.fontColor ?? Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            leading: QueryArtworkWidget(
                artworkBorder: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.03),
                id: Musics.songslist[index].id,
                type: ArtworkType.AUDIO),
            trailing: InkWell(
              onTap: () {
                CustomWidgets.more(context, index, item);
              },
              child: Icon(Icons.more_vert,
                  color: Themecolors.fontColor ?? Colors.white, size: 40.sp),
            ),
          ),
        ),
      );
    }
  }
}
