import 'package:flutter/material.dart';

class NewRecipeSmallCard extends StatelessWidget {
  final String title;
  final String dishImage;
  final String authorImage;
  final String authorName;
  final String time;
  final VoidCallback onTap;

  // ---------- Tunables ----------
  // Card rectangle
  final double cardWidth;
  final double vPadTop;
  final double vPadBottom;
  final double hPadLeft;
  final double rightPadForCircle;
  final double cardRightMargin;
  final double cardRadius;

  // Circle
  final double circleSize;
  final double circleRightOffset; // (further right/outside)
  final double circleTopOffset; // (higher)
  final double circleShadowBlur;
  final double circleShadowOffsetY;

  // Typography
  final double titleFontSize;
  final FontWeight titleWeight;

  final int starCount;
  final double starSize;
  final double starGap;

  // Meta row
  final double authorAvatarSize;
  final double metaFontSize;
  final FontWeight metaWeight;
  final double timeIconSize;
  final double timeIconTextGap;

  // Shadows
  final List<BoxShadow> cardShadows;

  const NewRecipeSmallCard({
    super.key,
    required this.title,
    required this.dishImage,
    required this.authorImage,
    required this.authorName,
    required this.time,
    required this.onTap,

    // Card rectangle
    this.cardWidth = 308,
    this.vPadTop = 12,
    this.vPadBottom = 12,
    this.hPadLeft = 16,
    this.rightPadForCircle = 136,
    this.cardRightMargin = 22,
    this.cardRadius = 16,

    // Circle pose
    this.circleSize = 122,
    this.circleRightOffset = -124,
    this.circleTopOffset = -55,
    this.circleShadowBlur = 22,
    this.circleShadowOffsetY = 12,

    // Type
    this.titleFontSize = 16,
    this.titleWeight = FontWeight.w800,

    // Stars
    this.starCount = 5,
    this.starSize = 18,
    this.starGap = 2,

    // Meta row (avatar + time)
    this.authorAvatarSize = 22,
    this.metaFontSize = 13,
    this.metaWeight = FontWeight.w600,
    this.timeIconSize = 14,
    this.timeIconTextGap = 3,

    // Card shadow
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
          hPadLeft,
          vPadTop,
          rightPadForCircle,
          vPadBottom,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(cardRadius),
          boxShadow: cardShadows,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // -------- Content column --------
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: titleWeight, fontSize: titleFontSize),
                ),
                const SizedBox(height: 6),

                // Stars
                Row(
                  children: List.generate(
                    starCount,
                    (_) => Padding(
                      padding: EdgeInsets.only(right: starGap),
                      child: SizedBox(
                        width: starSize,
                        height: starSize,
                        child: Image.asset(
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
                    // Author
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        authorImage,
                        width: authorAvatarSize,
                        height: authorAvatarSize,
                        fit: BoxFit.cover,
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

                    // Time
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
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

            // -------- Circle
            Positioned(
              right: circleRightOffset,
              top: circleTopOffset,
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: circleShadowBlur,
                      color: const Color(0x26000000),
                      offset: Offset(0, circleShadowOffsetY),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(dishImage, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
