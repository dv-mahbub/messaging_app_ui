import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messaging_app_ui/constants/colors.dart';
import 'package:messaging_app_ui/constants/custom_back_button.dart';
import 'package:provider/provider.dart';

import '../constants/theme_selector_container.dart';
import '../theme/theme_notifier.dart';

class ThemeSelectorPage extends StatelessWidget {
  const ThemeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
          leading: CustomBackButton(context: context, iconColor: appBarTittleColor(themeNotifier.currentTheme)),
          title: Text('Theme', style: TextStyle(color: appBarTittleColor(themeNotifier.currentTheme)),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: themeNotifier.currentTheme.scaffoldBackgroundColor
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              ThemeSelectorContainer(text: "System"),
              ThemeSelectorContainer(text: "Light"),
              ThemeSelectorContainer(text: "Dark"),
            ],
          ),
        ),
      ),
    );
  }
}
