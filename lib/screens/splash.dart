import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_cricket/utils/app_colors.dart';
import 'package:local_cricket/utils/app_images.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    runSplash();
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Image.asset(
          AppImages.logo,
          fit: BoxFit.contain,
          width: 300.w,
          height: 1300.h,
        ),
      ),
    );
  }

  //run splash screen for 3 seconds
  Future<void> runSplash() async {
    await Future.delayed(const Duration(seconds: 3), () {});
  }
}
