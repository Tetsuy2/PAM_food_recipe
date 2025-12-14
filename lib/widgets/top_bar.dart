import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(32, 22, 32, 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Jega',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 8),
                Text(
                  'What are you cooking today?',
                  style: TextStyle(
                    color: Color(0x99000000),
                    fontSize: 14.5,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          _Avatar(),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset('assets/profile.png', fit: BoxFit.cover),
      ),
    );
  }
}
