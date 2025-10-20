import 'package:flutter/material.dart';

class HeroRecipeCard extends StatelessWidget {
  final String image;
  final double rating;
  final String time;
  final VoidCallback onBookmark;

  const HeroRecipeCard({
    super.key,
    required this.image,
    required this.rating,
    required this.time,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 14),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
              blurRadius: 16, color: Color(0x14000000), offset: Offset(0, 8)),
        ],
      ),
      child: Stack(
        children: [
          Image.asset(
            image,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            filterQuality: FilterQuality.high,
            errorBuilder: (_, __, ___) => const ColoredBox(
              color: Color(0x11FF0000),
              child: SizedBox(height: 160, width: double.infinity),
            ),
          ),
          const PositionedFillGradient(),
          PositionedRatingPill(ratingText: rating.toStringAsFixed(1)),
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.access_time, size: 14, color: Colors.white),
                      SizedBox(width: 6),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onBookmark,
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Image.asset('assets/inactive_bookmark.png',
                        width: 16, height: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PositionedFillGradient extends StatelessWidget {
  const PositionedFillGradient({super.key});
  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0, 0.3),
            end: Alignment.bottomCenter,
            colors: [Color(0x00000000), Color(0xAA000000)],
          ),
        ),
      ),
    );
  }
}

class PositionedRatingPill extends StatelessWidget {
  final String ratingText;
  const PositionedRatingPill({super.key, required this.ratingText});
  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            Text(ratingText,
                style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
