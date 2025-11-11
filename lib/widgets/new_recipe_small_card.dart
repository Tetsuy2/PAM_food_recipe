// lib/widgets/new_recipe_small_card.dart
import 'package:flutter/material.dart';
import '../core/image_loader.dart';

class NewRecipeSmallCard extends StatelessWidget {
  final String title;
  final String dishImage;
  final String authorImage; // may be empty; we hard-fallback below
  final String authorName;
  final String time;
  final VoidCallback onTap;

  // layout
  final double cardWidth;
  final double vPadTop;
  final double vPadBottom;
  final double hPadLeft;
  final double rightPadForCircle;
  final double cardRightMargin;
  final double cardRadius;

  // circle
  final double circleSize;
  final double circleRightOffset;
  final double circleTopOffset;
  final double circleShadowBlur;
  final double circleShadowOffsetY;

  // type
  final double titleFontSize;
  final FontWeight titleWeight;

  // stars
  final int starCount;
  final double starSize; // true icon size
  final double starGap;

  // meta
  final double authorAvatarSize;
  final double metaFontSize;
  final FontWeight metaWeight;
  final double timeIconSize;
  final double timeIconTextGap;

  final List<BoxShadow> cardShadows;

  const NewRecipeSmallCard({
    super.key,
    required this.title,
    required this.dishImage,
    required this.authorImage,
    required this.authorName,
    required this.time,
    required this.onTap,
    this.cardWidth = 308,
    this.vPadTop = 12,
    this.vPadBottom = 12,
    this.hPadLeft = 16,
    this.rightPadForCircle = 136,
    this.cardRightMargin = 22,
    this.cardRadius = 16,
    this.circleSize = 122,
    this.circleRightOffset = -124,
    this.circleTopOffset = -55,
    this.circleShadowBlur = 22,
    this.circleShadowOffsetY = 12,
    this.titleFontSize = 16,
    this.titleWeight = FontWeight.w800,
    this.starCount = 5,
    this.starSize = 15,
    this.starGap = 2,
    this.authorAvatarSize = 22,
    this.metaFontSize = 13,
    this.metaWeight = FontWeight.w600,
    this.timeIconSize = 14,
    this.timeIconTextGap = 3,
    this.cardShadows = const [
      BoxShadow(
          color: Color(0x1F000000), blurRadius: 28, offset: Offset(0, 14)),
      BoxShadow(color: Color(0x14000000), blurRadius: 16, offset: Offset(0, 6)),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(cardRadius),
      onTap: onTap,
      child: Container(
        width: cardWidth,
        margin: EdgeInsets.only(right: cardRightMargin),
        padding: EdgeInsets.fromLTRB(
            hPadLeft, vPadTop, rightPadForCircle, vPadBottom),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(cardRadius),
          boxShadow: cardShadows,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: titleWeight, fontSize: titleFontSize),
                ),
                const SizedBox(height: 6),
                Row(
                  children: List.generate(
                    starCount,
                    (_) => Padding(
                      padding: EdgeInsets.only(right: starGap),
                      child: SizedBox(
                        width: starSize,
                        height: starSize,
                        child: const UiImage(
                          'assets/star.png',
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Avatar with hard fallback to user1.png if missing/bad path
                    ClipOval(
                      child: Image.asset(
                        authorImage.isEmpty ? 'assets/user1.png' : authorImage,
                        width: authorAvatarSize,
                        height: authorAvatarSize,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Image.asset(
                          'assets/user1.png',
                          width: authorAvatarSize,
                          height: authorAvatarSize,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'By $authorName',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: metaFontSize,
                          fontWeight: metaWeight,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UiImage(
                          'assets/timer.png',
                          width: timeIconSize,
                          height: timeIconSize,
                          color: Colors.black38,
                        ),
                        SizedBox(width: timeIconTextGap),
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: metaFontSize,
                            fontWeight: metaWeight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: circleRightOffset,
              top: circleTopOffset,
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 22,
                        color: Color(0x26000000),
                        offset: Offset(0, 12)),
                  ],
                ),
                child: ClipOval(child: UiImage(dishImage, fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
