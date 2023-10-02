import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_notifier.dart';
import 'colors.dart';
import 'custom_back_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return AppBar(
        leading: CustomBackButton(context: context, iconColor: appBarTittleColor(themeNotifier.currentTheme)),
        title: Text('Theme', style: TextStyle(color: appBarTittleColor(themeNotifier.currentTheme)),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: themeNotifier.currentTheme.scaffoldBackgroundColor
    );
  }
}
