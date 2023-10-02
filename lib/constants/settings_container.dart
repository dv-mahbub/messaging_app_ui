import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messaging_app_ui/constants/spacing.dart';
import 'package:provider/provider.dart';

import '../theme/theme_notifier.dart';

// ignore: must_be_immutable
class SettingsContainer extends StatelessWidget {
  IconData icons;
  String text;
  Function() onTap;
  SettingsContainer({super.key, required this.icons, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: themeNotifier.currentTheme == ThemeData.light()
                ? Colors.black12:Colors.white12,
            borderRadius: BorderRadius.circular(10.h),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(icons),
                    HorizontalSpacing(3.w),
                    Text(text, style: TextStyle(fontSize: 15.h, color: themeNotifier.currentTheme==ThemeData.light()?Colors.black:Colors.white),),
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          )
        ),
      ),
    );
  }
}
