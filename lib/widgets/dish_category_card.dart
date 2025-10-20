import 'package:flutter/material.dart';

class DishCategoryCard extends StatelessWidget {
  final String title;
  final String time;
  final double rating;
  final String image;
  final VoidCallback onTap;

  const DishCategoryCard({
    super.key,
    required this.title,
    required this.time,
    required this.rating,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Colors
    const Color gray = Color(0xFFE6EAEE);
    const Color borderGray = Color(0xFFD8DEE4);

    // Sizes
    const double circleSize = 112.0; // round dish diameter
    const double cardRadius = 18.0;

    const double gapBetweenCircleAndCard = 6.0;

    const double cardHeight = 188.0;
    const double cardTopOffset = circleSize / 2 + gapBetweenCircleAndCard;
    const double totalHeight = cardTopOffset + cardHeight;

    return Container(
      margin: const EdgeInsets.only(right: 14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(cardRadius),
        child: SizedBox(
          width: 188,
          height: totalHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: cardTopOffset,
                left: 0,
                right: 0,
                child: Container(
                  height: cardHeight,
                  decoration: BoxDecoration(
                    color: gray,
                    border: Border.all(color: borderGray),
                    borderRadius: BorderRadius.circular(cardRadius),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 18,
                        color: Color(0x14000000),
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 54, 16, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Time',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Text(
                              time,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color(0x11000000),
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/inactive_bookmark.png',
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: circleSize,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: circleSize,
                          height: circleSize,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 22,
                                color: Color(0x1A000000),
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(image, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        top: circleSize * 0.30,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFCE8CC),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x14000000),
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset('assets/star.png',
                                  width: 11, height: 11),
                              const SizedBox(width: 4),
                              Text(
                                rating.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
