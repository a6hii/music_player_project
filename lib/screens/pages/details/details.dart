import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../custom/custom_widgets.dart';
import '../../theme.dart';
import 'about.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'Details',
                    style: TextStyle(
                        color: Themecolors.fontColor ?? Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    SizedBox(height: 10.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reset App',
                            style: TextStyle(
                                color: Themecolors.fontColor ?? Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18.sp),
                          ),
                          IconButton(
                              onPressed: () {
                                CustomWidgets.reset(context);
                              },
                              icon: Icon(Icons.restart_alt,
                                  color: Themecolors.fontColor ?? Colors.white,
                                  size: 22.sp))
                        ]),
                    const Expanded(flex: 1, child: SizedBox()),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Themes',
                            style: TextStyle(
                                color: Themecolors.fontColor ?? Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 18.sp),
                          ),
                          IconButton(
                              onPressed: () {
                                Themecolors.themeselection(context);
                              },
                              icon: Icon(
                                Icons.brush,
                                color: Themecolors.fontColor ?? Colors.white,
                                size: 22.sp,
                              ))
                        ]),
                    const Expanded(flex: 1, child: SizedBox()),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showAboutDialog(
                                  applicationName: 'Panda Music',
                                  applicationVersion: '0.1',
                                  context: context,
                                  children: [const PrivacyPoicy()]);
                            },
                            child: Text(
                              'About',
                              style: TextStyle(
                                  color: Themecolors.fontColor ?? Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18.sp),
                            ),
                          ),
                        ]),
                    const Expanded(flex: 15, child: SizedBox()),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Version    1.0.0',
                style: TextStyle(
                    color: Themecolors.fontColor ?? Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  InkWell(
                    onTap: () async {
                      if (!await launchUrl(
                          Uri.parse('https://github.com/a6hii'))) {
                        throw 'Could not launch';
                      }
                    },
                    child: FaIcon(
                      FontAwesomeIcons.github,
                      color: Themecolors.fontColor ?? Colors.grey,
                      size: 40.sp,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () async {
                      if (!await launchUrl(Uri.parse(
                          'https://www.linkedin.com/in/abhishek-kumar-394299150/'))) {
                        throw 'Could not launch';
                      }
                    },
                    child: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Themecolors.fontColor ?? Colors.grey,
                      size: 40.sp,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
