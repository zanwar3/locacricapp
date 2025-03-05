import 'dart:async';
import 'dart:ui';

import 'package:carousel_slider_x/carousel_slider_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:local_cricket/utils/app_colors.dart';
import 'package:local_cricket/utils/app_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:neon_widgets/neon_widgets.dart';

import '../utils/app_images.dart';

class WaitingListScreen extends StatelessWidget {
  const WaitingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: PreferredSize(
          preferredSize: Size(1.sw, 50.h),
          child: NeonContainer(
              padding: EdgeInsets.only(top: 0.05.sh),
              margin: EdgeInsets.zero,
              borderColor: AppColors.black,
              containerColor: AppColors.black,
              spreadColor: AppColors.neonGreen,
              lightSpreadRadius: 1.sp,
              lightBlurRadius: 20.sp,
              child: Row(
                children: [
                  Image.asset(
                    AppImages.logo,
                    fit: BoxFit.contain,
                    width: 100.w,
                    height: 100.h,
                  ),
                  FlickerNeonText(
                    text: "Loca Cric",
                    flickerTimeInMilliSeconds: 600,
                    spreadColor: Colors.blue,
                    blurRadius: 20,
                    textSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.neonGreen,
                    fontFamily: AppFonts.orbitron,
                    letterSpacing: 2.sp,
                  ),
                ],
              ))),
      body: Stack(
        children: [
          Lottie.asset(AppImages.dots,
              fit: BoxFit.cover, width: 1.sw, height: 1.sh),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  30.verticalSpace,
                  Center(
                    child: RichText(
                        text: TextSpan(
                      text: "Ab Aye Ga Asli",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: " Talent",
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 15.sp,
                            fontFamily: AppFonts.orbitron,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  ),
                  8.verticalSpace,
                  Center(
                    child: RichText(
                        text: TextSpan(
                      text: "Track Your Cricket Performance Like a ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "Pro",
                          style: TextStyle(
                            color: AppColors.neonGreen,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  ),
                  15.verticalSpace,
                  Center(
                    child: RichText(
                        text: TextSpan(
                      text: "Coming Soon to ",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15.sp,
                        fontFamily: AppFonts.orbitron,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "Lahore",
                          style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 15.sp,
                            fontFamily: AppFonts.orbitron,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  ),
                  30.verticalSpace,
                  SizedBox(width: 1.sw, height: 100.h, child: CountdownTimer()),
                  30.verticalSpace,

                  //get notified text field
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: NeonSearchBar(
                        hint: "Get Notified",
                        borderColor: AppColors.neonGreen,
                        backgroundColor: AppColors.black,
                        spreadColor: AppColors.neonGreen,
                        lightBlurRadius: 20.sp,
                        icon: Icons.send,
                        onSearchTap: () {
                          Get.snackbar(
                              "Email Notification", "You will be notified soon",
                              backgroundColor: AppColors.black,
                              colorText: AppColors.neonGreen);
                        }),
                  ),
                  CarouselSlider(
                      options: CarouselOptions(
                        autoPlayAnimationDuration: Duration(milliseconds: 500),
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        aspectRatio: 1,
                        viewportFraction: 1,
                        autoPlayInterval: Duration(seconds: 2),
                      ),
                      items: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.bowl,
                              height: 200.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: _buildTimeBox(3, "Wickets")),
                                Expanded(child: _buildTimeBox(4, "Economy")),
                                Expanded(
                                    child: _buildTimeBox(145, "Speed(km/h)"))
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              AppImages.bat,
                              height: 200.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: _buildTimeBox(135, "Runs")),
                                Expanded(
                                    child: _buildTimeBox(70, "Strike Rate")),
                                Expanded(child: _buildTimeBox(14, "Strikes"))
                              ],
                            )
                          ],
                        ),
                      ]),
                  30.verticalSpace,

                  NeonText(
                    text: "App Features",
                    spreadColor: AppColors.neonGreen,
                    blurRadius: 60,
                    letterSpacing: 3.sp,
                    textSize: 30.sp,
                    fontFamily: AppFonts.orbitron,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.neonGreen,
                  ),

                  20.verticalSpace,
                  NeonCard(
                    icon: FontAwesomeIcons.lineChart,
                    title: "Complete Cricket Stats",
                    description:
                        "Track batting averages, bowling figures, fielding stats, and more with detailed analytics.",
                  ),
                  10.verticalSpace,
                  NeonCard(
                    icon: FontAwesomeIcons.users,
                    title: "Team Management",
                    description:
                        "Create and manage your team, schedule practices, and coordinate matches effortlessly.",
                  ),
                  10.verticalSpace,
                  NeonCard(
                    icon: FontAwesomeIcons.trophy,
                    title: "Challenge Teams",
                    description:
                        "Find and challenge other teams in Lahore for friendly matches or tournaments.",
                  ),
                  10.verticalSpace,
                  NeonCard(
                    icon: FontAwesomeIcons.medal,
                    title: "Leaderboards",
                    description:
                        "See how you rank among the top 10 players in various categories across Lahore.",
                  ),
                  10.verticalSpace,
                  NeonCard(
                    icon: FontAwesomeIcons.chartPie,
                    title: "Visual Analytics",
                    description:
                        "Understand your performance with intuitive graphs and visual representations.",
                  ),
                  NeonCard(
                    icon: FontAwesomeIcons.video,
                    title: "Video Analysis",
                    description:
                        "Understand your performance with intuitive graphs and visual representations.",
                  ),
                  50.verticalSpace,

                  Container(
                    color: AppColors.black,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        NeonText(
                          text: "Track Stats Like Never Before",
                          spreadColor: AppColors.neonGreen,
                          blurRadius: 60,
                          letterSpacing: 3.sp,
                          textSize: 30.sp,
                          fontFamily: AppFonts.orbitron,
                          fontWeight: FontWeight.w900,
                          textColor: AppColors.neonGreen,
                        ),
                        10.verticalSpace,
                        Text(
                          "Comprehensive analytics to improve your game",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                        20.verticalSpace,
                        Image.asset(AppImages.playerImage),
                        20.verticalSpace,
                        NeonCardVertical(
                          icon: FontAwesomeIcons.chartLine,
                          title: "Batting Analysis",
                          description:
                              "Track your runs, strike rate, boundaries, and batting average over time.",
                        ),
                        10.verticalSpace,
                        NeonCardVertical(
                          icon: FontAwesomeIcons.chartLine,
                          title: "Batting Analysis",
                          description:
                              "Track your runs, strike rate, boundaries, and batting average over time.",
                        ),
                        10.verticalSpace,
                        NeonCardVertical(
                          icon: FontAwesomeIcons.chartLine,
                          title: "Batting Analysis",
                          description:
                              "Track your runs, strike rate, boundaries, and batting average over time.",
                        ),
                        10.verticalSpace,
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  NeonText(
                    text: "Contact Us",
                    spreadColor: AppColors.neonGreen,
                    blurRadius: 60,
                    letterSpacing: 3.sp,
                    textSize: 30.sp,
                    fontFamily: AppFonts.orbitron,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.neonGreen,
                  ),
                  3.verticalSpace,
                  Text(
                    "Have questions? We're here to help!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                  20.verticalSpace,
                  SizedBox(
                    width: 0.8.sw,
                    child: NeonCardVertical(
                      icon: FontAwesomeIcons.envelope,
                      title: "info@LocaCric.pk",
                      description: "",
                    ),
                  ),
                  SizedBox(
                    width: 0.8.sw,
                    child: NeonCardVertical(
                      icon: FontAwesomeIcons.phone,
                      title: "info@LocaCric.pk",
                      description: "",
                    ),
                  ),
                  SizedBox(
                    width: 0.8.sw,
                    child: NeonCardVertical(
                      icon: FontAwesomeIcons.locationPin,
                      title: "MM Alam Road, Gulberg III, Lahore",
                      description: "",
                    ),
                  ),
                  50.verticalSpace,
                  Container(
                    child: Column(
                      children: [
                        NeonLine(
                          lineWidth: 1.sw,
                          lineHeight: 2.sp,
                          lineColor: AppColors.neonGreen,
                          spreadColor: AppColors.neonGreen,
                          lightBlurRadius: 20.sp,
                          lightSpreadRadius: 5,
                        ),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.all(20.sp),
                          child: Text(
                            "© 2025 LocaCric. All rights reserved.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    DateTime targetDate = DateTime.now()
        .add(const Duration(days: 28, hours: 22, minutes: 31, seconds: 53));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft = targetDate.difference(DateTime.now());
        if (_timeLeft.isNegative) {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimeBox(_timeLeft.inDays, "Days"),
            _buildTimeBox(_timeLeft.inHours.remainder(24), "Hours"),
            _buildTimeBox(_timeLeft.inMinutes.remainder(60), "Minutes"),
            _buildTimeBox(_timeLeft.inSeconds.remainder(60), "Seconds"),
          ],
        ),
      ),
    );
  }
}

Widget _buildTimeBox(int value, String label) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(color: Colors.greenAccent.withOpacity(0.5), blurRadius: 10)
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value.toString().padLeft(2, '0'),
          style: const TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green),
        ),
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.white)),
      ],
    ),
  );
}

class NeonCard extends StatelessWidget {
  IconData icon;
  String title;
  String description;

  NeonCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.neonGreen.withOpacity(0.5),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(color: AppColors.neonGreen.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            size: 40,
            color: AppColors.neonGreen,
          ),
          12.verticalSpace,
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class NeonCardVertical extends StatelessWidget {
  IconData icon;
  String title;
  String description;

  NeonCardVertical(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.blue.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          FaIcon(
            icon,
            size: 30,
            color: AppColors.blue,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (description.isNotEmpty) ...[
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
