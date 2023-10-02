import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBackButton extends StatelessWidget {
  BuildContext context;
  Color iconColor;
  CustomBackButton({super.key, required this.context, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xbdbdbd91),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: iconColor,),
              onPressed: (){
                Navigator.pop(this.context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
