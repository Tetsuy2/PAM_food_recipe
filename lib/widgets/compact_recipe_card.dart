import 'package:flutter/material.dart';
import '../core/image_loader.dart';

class CompactRecipeCard extends StatelessWidget {
  final String title;
  final String dishImage;
  final String authorImage;
  final String authorName;
  final String time;
  const CompactRecipeCard({
    super.key,
    required this.title,
    required this.dishImage,
    required this.authorImage,
    required this.authorName,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              blurRadius: 24, color: Color(0x18000000), offset: Offset(0, 12))
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 16)),
              const SizedBox(height: 6),
              Row(
                  children: List.generate(
                      5,
                      (_) => const Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: UiImage('assets/star.png',
                              width: 18, height: 18)))),
              const SizedBox(height: 10),
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: UiImage(authorImage,
                          width: 22, height: 22, fit: BoxFit.cover)),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Text('By $authorName',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.black54))),
                  const UiImage('assets/timer.png',
                      width: 14, height: 14, color: Colors.black45),
                  const SizedBox(width: 6),
                  Text(time, style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
          Positioned(
            right: -10,
            top: -28,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 14,
                        color: Color(0x22000000),
                        offset: Offset(0, 8))
                  ]),
              child: ClipOval(child: UiImage(dishImage, fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
    );
  }
}
