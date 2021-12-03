import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/theme.dart' show kPrimaryColor;

class AppBarIconButton extends StatelessWidget {
  AppBarIconButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      double? borderRadius,
      Color? borderColor})
      : borderColor = borderColor ?? kPrimaryColor.withOpacity(0.2),
        borderRadius = borderRadius ?? 10.sp,
        super(key: key);

  final Widget child;
  final Function() onPressed;
  final Color borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox.square(
        dimension: 38.w,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
