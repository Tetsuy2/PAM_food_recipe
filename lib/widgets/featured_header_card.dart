import 'package:flutter/material.dart';

class FeaturedHeaderCard extends StatelessWidget {
  final String image;
  final String time;
  final String rating;
  const FeaturedHeaderCard({
    super.key,
    required this.image,
    required this.time,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(image,
              height: 180, width: double.infinity, fit: BoxFit.cover),
          // vignette
          Container(
            height: 180,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [Color(0xCC000000), Color(0x00000000)],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE8CC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset('assets/star.png', width: 12, height: 12),
                  const SizedBox(width: 4),
                  Text(rating,
                      style: const TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: .45),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/timer.png',
                          width: 14, height: 14, color: Colors.white),
                      const SizedBox(width: 6),
                      Text(time, style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .90),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset('assets/inactive_bookmark.png',
                      width: 16, height: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
