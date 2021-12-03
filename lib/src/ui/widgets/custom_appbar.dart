import 'package:flutter/material.dart';
import './appbar_icon_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  CustomAppBar({
    Key? key,
    required this.title,
    AppBarIconButton? leading,
    AppBarIconButton? trailing,
  })  : leading = leading ?? SizedBox.square(dimension: 38.w),
        trailing = trailing ?? SizedBox.square(dimension: 38.w),
        super(key: key);

  final String title;
  final Widget leading;
  final Widget trailing;

  @override
  Widget get child => AppBar();

  @override
  Size get preferredSize => Size.fromHeight(87.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: _buildChild(context),
    );
  }

  SafeArea _buildChild(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leading,
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            trailing
          ],
        ),
      ),
    );
  }
}
