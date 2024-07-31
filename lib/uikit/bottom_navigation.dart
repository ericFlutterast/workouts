import 'dart:ui';

import 'package:flutter/material.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation({
    super.key,
    required this.onTap,
    this.children,
  });

  final void Function(int) onTap;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        border: const Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < 4; i++)
                  IconButton(
                    onPressed: () => onTap(i),
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white70,
                      size: 30,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
