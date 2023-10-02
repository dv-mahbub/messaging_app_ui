import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messaging_app_ui/constants/settings_container.dart';
import 'package:messaging_app_ui/constants/spacing.dart';
import 'package:messaging_app_ui/views/theme_selector_page.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/custom_back_button.dart';
import '../theme/theme_notifier.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
          leading: CustomBackButton(context: context, iconColor: appBarTittleColor(themeNotifier.currentTheme)),
          title: Text('Settings', style: TextStyle(color: appBarTittleColor(themeNotifier.currentTheme)),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: themeNotifier.currentTheme.scaffoldBackgroundColor
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [

            //avatar, name and id
            Row(
              children: [
                CircleAvatar(
                  radius: 25.h,
                  backgroundImage: const AssetImage('assets/images/m.jpg'),
                ),
                HorizontalSpacing(5.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ryn Gosling', style: TextStyle(fontSize: 15.sp ,fontWeight: FontWeight.bold),),
                    VerticalSpacing(5.h),
                    Text('ryn247', style: TextStyle(fontSize: 12.sp),),
                  ],
                )
              ],
            ),
            VerticalSpacing(7.h),
            //progress box
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black54, Colors.black],
                ),
                borderRadius: BorderRadius.circular(10.h),
              ),

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your Plan', style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),),
                        Text('12d remaining', style: TextStyle(color: Colors.white, fontSize: 9.sp),),
                      ],
                    ),

                    VerticalSpacing(13.h),

                    LinearProgressIndicator(
                      value: .55,
                      backgroundColor: themeNotifier.currentTheme==ThemeData.light()?Colors.white:Colors.white38,
                      borderRadius: BorderRadius.circular(5.h),
                      minHeight: 7.h,
                    ),

                    VerticalSpacing(13.h),

                    Text('Reset on sept 24, 2023', style: TextStyle(fontSize: 9.sp, color: Colors.white),),
                  ],
                ),
              ),

            ),

            VerticalSpacing(7.h),

            SettingsContainer(
              icons: Icons.person_4_outlined,
              onTap: (){},
              text: 'Account Settings',
            ),

            SettingsContainer(
              icons: Icons.notifications_none,
              onTap: (){},
              text: 'Notification',
            ),

            SettingsContainer(
              icons: Icons.ad_units,
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ThemeSelectorPage()));
              },
              text: 'Theme Setting',
            ),
          ],
        ),
      ),
    );
  }
}






