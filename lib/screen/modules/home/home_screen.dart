import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../style/app_colors.dart';
import '../../style/app_text_styles.dart';
import '../../style/global_variables.dart';

class HomeScreen extends GetView {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.w),
              child: SvgPicture.asset(
                "${imgDir}logo/logo.svg",
                width: 53.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: aiSearchSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget aiSearchSection() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.aiSearch);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 23.w, horizontal: 16.w),
        decoration: BoxDecoration(
            color: AppColors.cF8F9F9, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("위즈 AI",
                    style: AppTextStyles.title2Bold
                        .copyWith(color: AppColors.grey9)),
                Text(
                  "알기 어려운 특수 쓰레기 배출법을 빠르게",
                  style: AppTextStyles.title3SemiBold.copyWith(
                    color: AppColors.grey7,
                  ),
                )
              ],
            ),
            SvgPicture.asset("${iconDir}Search.svg", width: 24.w),
          ],
        ),
      ),
    );
  }
}
