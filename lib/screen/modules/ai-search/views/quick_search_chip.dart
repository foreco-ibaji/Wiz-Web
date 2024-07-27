import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../style/app_colors.dart';
import '../../../style/app_text_styles.dart';
import '../../../style/global_variables.dart';
import '../ai_search_controller.dart';


class QuickSearchChip extends StatelessWidget {
  final AiQuickChip quickChip;
  final Function(AiQuickChip) onTap;

  const QuickSearchChip(
    this.quickChip, {
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(quickChip),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
        decoration: BoxDecoration(
          color: AppColors.grey1,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Row(
          children: [
            SvgPicture.asset("$iconDir${quickChip.iconUrl}.svg"),
            SizedBox(
              width: 6.w,
            ),
            Text(
              quickChip.value,
              style: AppTextStyles.body1SemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
