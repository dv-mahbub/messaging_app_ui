// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messaging_app_ui/constants/spacing.dart';
import 'package:messaging_app_ui/views/message_page.dart';
import 'package:messaging_app_ui/views/settings.dart';
import 'package:provider/provider.dart';

import '../components/nav_bar.dart';
import '../components/slide_switcher.dart';
import '../constants/colors.dart';
import '../theme/theme_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);


    return Scaffold(
      appBar: AppBar(
          title: Text('Message', style: TextStyle(color: appBarTittleColor(themeNotifier.currentTheme)),),
          elevation: 0,
          backgroundColor: themeNotifier.currentTheme.scaffoldBackgroundColor,
          actions: [
            IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SettingsPage()));},
                icon: Icon(Icons.settings, color: themeNotifier.currentTheme==ThemeData.light()?Colors.black54:Colors.white70,))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                  child: SearchBar(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                      if (themeNotifier.currentTheme == ThemeData.light()) {
                        return Colors.black12;
                      } else {
                        return Colors.white12;
                      }
                    }),
                    trailing: [
                      const Icon(Icons.search_outlined),
                      HorizontalSpacing(5.w),
                    ],
                  ),
                ),

                VerticalSpacing(7.h),
                //tab bar
                SlideSwitcher(
                  onSelect: (index) {},
                  containerHeight: 40.h,
                  containerWight: 335.w,
                  containerColor: themeNotifier.currentTheme==ThemeData.light()?Colors.black12:Colors.white12,
                  // ignore: prefer_const_literals_to_create_immutables
                  text: [
                    'Chats', 'Groups', 'Calls'
                    ],
                ),
               // CustomContainer(switcherIndex),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: NavBar(

        currentIndex: 1,
        paddingBackgroundColor: Colors.transparent,
        items: [
          SweetNavBarItem(
              sweetActive: const Icon(Icons.person_3_outlined, color: Colors.black45,),
              sweetIcon: const Icon(
                Icons.home_outlined, color: Colors.black45,
              ),
              sweetLabel: 'Home',
              sweetBackground: Colors.blue),
          SweetNavBarItem(
              sweetIcon: Transform.scale(scale: 1.8, child: CircleAvatar(backgroundColor: Colors.blue,radius: 11.h ,child: const Icon(Icons.add, color: Colors.white,))),
            sweetBackground: Colors.blue,
            sweetLabel: 'Business',
          ),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.settings_outlined, color: Colors.black45,), sweetLabel: 'Settings'),
        ],
        onTap: (index) {
          setState(() {

          });
        },
      ),
    );
  }

}

class TabContent extends StatefulWidget {
  final int switcherIndex;

  // ignore: prefer_const_constructors_in_immutables
  TabContent(this.switcherIndex);

  @override
  // ignore: library_private_types_in_public_api
  _TabContentState createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  @override
  Widget build(BuildContext context) {
    // Use widget.switcherIndex directly here
    return _customContainer(widget.switcherIndex);
  }

  Widget _customContainer(int switcherIndex) {
    if (switcherIndex == 0) {
      return SizedBox(
        height: .7.sh,
        width: .9.sw,
        child: Column(
          children: [
            VerticalSpacing(7.h),
            contactList('Dora', 'assets/images/f.jpg', '2m', '3'),
            contactList('Liam', 'assets/images/m.jpg', '30m', '1'),
            contactList('Elijah', 'assets/images/f.jpg', '1h', '2'),
            contactList('Benjamim', 'assets/images/m.jpg', '3h', '4'),
          ],
        ),
      );
    } else {
      return SizedBox(
        height: .7.sh,
        width: .9.sw,
        child: Center(
          child: Text(
            switcherIndex == 1 ? 'No groups found' : 'Empty call list',
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      );
    }
  }

  contactList(String name, String imageLoc, String time, String newMessage){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: InkWell(
        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MessagePage(name: name)));},
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.h,
              backgroundImage: AssetImage(imageLoc),
            ),
            HorizontalSpacing(5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name, style: TextStyle(fontSize: 15.sp ,fontWeight: FontWeight.bold),),
                VerticalSpacing(5.h),
                Text('I heard from multiple people at TED...', maxLines: 1, overflow: TextOverflow.fade, style: TextStyle(fontSize: 12.sp),),
              ],
            ),
            Expanded(child: Container(),),
            Column(
              children: [
                Text(time),
                CircleAvatar(
                  radius: 8.h,
                  backgroundColor: Colors.blue,
                  child: Text(newMessage, style: const TextStyle(color: Colors.white),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
