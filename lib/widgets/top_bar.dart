import 'package:flutter/material.dart';
import '../core/image_loader.dart';

class TopBar extends StatelessWidget {
  final String name;
  final String greeting;
  final String profileImage;
  const TopBar({
    super.key,
    required this.name,
    required this.greeting,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 22, 32, 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello $name',
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                Text(
                  greeting,
                  style: const TextStyle(
                    color: Color(0x99000000),
                    fontSize: 14.5,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          _Avatar(src: profileImage),
        ],
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String src;
  const _Avatar({required this.src});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: UiImage(src, fit: BoxFit.cover),
      ),
    );
  }
}
