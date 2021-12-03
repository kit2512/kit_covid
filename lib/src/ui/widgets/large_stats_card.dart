import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LargeStatsCard extends StatelessWidget {
  const LargeStatsCard({
    Key? key,
    required this.title,
    required this.number,
    this.backgroundColor,
    this.titleColor,
  }) : super(key: key);
  final String title;
  final int number;
  final Color? backgroundColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164.w,
      padding: EdgeInsets.symmetric(vertical: 22.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? kPrimaryColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: titleColor ?? Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 3.h),
          AutoSizeText(
            number.formatNumber,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: titleColor ?? Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
