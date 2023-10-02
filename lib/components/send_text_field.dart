
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_notifier.dart';

class SendTextField extends StatelessWidget {
  const SendTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: themeNotifier.currentTheme==ThemeData.light()?Colors.white38:Colors.white10,
        borderRadius: BorderRadius.circular(30.0), // Adjust the radius as needed
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white), // Text color
              decoration: InputDecoration(
                hintText: 'Type your message',
                hintStyle: TextStyle(color: Colors.grey), // Hint text color
                border: InputBorder.none, // Remove the default border
              ),
            ),
          ),
          IconButton(
            icon: CircleAvatar(child: const Icon(Icons.send, color: Colors.white), backgroundColor: Colors.blue),
            onPressed: () {
              // Handle send button tap here
            },
          ),
        ],
      ),
    );
  }
}
