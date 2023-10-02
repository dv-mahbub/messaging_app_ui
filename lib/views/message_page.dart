import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messaging_app_ui/constants/spacing.dart';
import 'package:provider/provider.dart';

import '../components/send_text_field.dart';
import '../constants/colors.dart';
import '../constants/custom_back_button.dart';
import '../theme/theme_notifier.dart';

class MessagePage extends StatefulWidget {
  final String name;
  const MessagePage({super.key, required this.name});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(context: context, iconColor: appBarTittleColor(themeNotifier.currentTheme)),
        title: Text(widget.name, style: TextStyle(color: appBarTittleColor(themeNotifier.currentTheme)),),
        elevation: 0,
        backgroundColor: themeNotifier.currentTheme.scaffoldBackgroundColor,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call, color: themeNotifier.currentTheme==ThemeData.light()?Colors.black54:Colors.white70,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.call, color: themeNotifier.currentTheme==ThemeData.light()?Colors.black54:Colors.white70,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz, color: themeNotifier.currentTheme==ThemeData.light()?Colors.black54:Colors.white70,)),
        ],
      ),
      backgroundColor: themeNotifier.currentTheme==ThemeData.light()?Color(0xffe3e3e3):Colors.black54,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container(
              child: Column(
                children: [
                  VerticalSpacing(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Text('29/07/2023'),
                        ),
                        decoration: BoxDecoration(
                          color: themeNotifier.currentTheme==ThemeData.light()?Colors.white: Colors.white38,
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                      )
                    ],
                  ),
                  VerticalSpacing(7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.more_vert),
                      HorizontalSpacing(5.w),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.h),
                          child: Text('Hey! What\'s up?', style: TextStyle(fontSize: 17.sp),),
                        ),
                      ),
                    ],
                  ),
                  VerticalSpacing(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Text('Today'),
                        ),
                        decoration: BoxDecoration(
                          color: themeNotifier.currentTheme==ThemeData.light()?Colors.white: Colors.white38,
                          borderRadius: BorderRadius.circular(10.h),
                        ),
                      )
                    ],
                  ),
                  VerticalSpacing(7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: themeNotifier.currentTheme==ThemeData.light()?Colors.white60: Colors.white24,
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.h),
                          child: Text('Nothing much. What about you?', style: TextStyle(fontSize: 17.sp),),
                        ),
                      ),
                      HorizontalSpacing(5.w),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ],
              ),
            )),
            Padding(
              padding: EdgeInsets.all(5.h),
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline, size: 35.sp,)),
                  const Expanded(child: SendTextField())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



