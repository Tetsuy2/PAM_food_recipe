import 'package:flutter/material.dart';

class NewRecipeSmallCard extends StatelessWidget {
  final String title;
  final String dishImage;
  final String authorImage;
  final String authorName;
  final String time;
  final VoidCallback onTap;

  final double cardWidth;
  final double vPadTop;
  final double vPadBottom;
  final double hPadLeft;
  final double rightPadForCircle;
  final double cardRightMargin;
  final double cardRadius;

  final double circleSize;
  final double circleRightOffset;
  final double circleTopOffset;
  final double circleShadowBlur;
  final double circleShadowOffsetY;

  final double titleFontSize;
  final FontWeight titleWeight;

  final int starCount;
  final double starSize;
  final double starGap;

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
    this.starSize = 18,
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

  Widget _buildDishImage() {
    if (dishImage.startsWith('http')) {
      return Image.network(
        dishImage,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            Image.asset('assets/new_food3.png', fit: BoxFit.cover),
      );
    }
    return Image.asset(dishImage, fit: BoxFit.cover);
  }

  Widget _buildAuthorImage() {
    if (authorImage.isEmpty) {
      return Image.asset('assets/user1.png', fit: BoxFit.cover);
    }
    if (authorImage.startsWith('http')) {
      return Image.network(
        authorImage,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            Image.asset('assets/user1.png', fit: BoxFit.cover),
      );
    }
    return Image.asset(authorImage, fit: BoxFit.cover);
  }

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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        width: authorAvatarSize,
                        height: authorAvatarSize,
                        child: _buildAuthorImage(),
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
                child: ClipOval(child: _buildDishImage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
