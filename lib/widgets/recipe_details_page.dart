import 'package:flutter/material.dart';

class IngredientItem {
  final String image;
  final String name;
  final String amount;
  const IngredientItem(
      {required this.image, required this.name, required this.amount});
}

class RecipeDetailsPage extends StatelessWidget {
  final String title;
  final String bannerImage;
  final String? gradientOverlay;
  final double rating;
  final String timeLabel;
  final String authorName;
  final String authorAvatar;
  final String locationLabel;
  final String reviewsLabel;
  final List<IngredientItem> ingredients;

  const RecipeDetailsPage({
    super.key,
    required this.title,
    required this.bannerImage,
    this.gradientOverlay,
    required this.rating,
    required this.timeLabel,
    required this.authorName,
    required this.authorAvatar,
    required this.locationLabel,
    required this.reviewsLabel,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    const hp = 28.0;
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        // banner
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: hp),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Stack(
              children: [
                Image.asset(bannerImage,
                    height: 200, width: double.infinity, fit: BoxFit.cover),
                if (gradientOverlay != null)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: Image.asset(gradientOverlay!,
                          fit: BoxFit.cover, alignment: Alignment.topCenter),
                    ),
                  ),
                // rating chip
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFCE8CC),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Image.asset('assets/star.png', width: 12, height: 12),
                        const SizedBox(width: 4),
                        Text(rating.toStringAsFixed(1),
                            style:
                                const TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
                // time
                Positioned(
                  right: 56,
                  bottom: 12,
                  child: Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 14, color: Colors.white),
                      const SizedBox(width: 6),
                      Text(
                        timeLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                color: Color(0x64000000),
                                blurRadius: 6,
                                offset: Offset(0, 1))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                    right: 12, bottom: 10, child: _BookmarkCircle()),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),

        // title + reviews
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: hp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(width: 8),
              Text(reviewsLabel, style: const TextStyle(color: Colors.black45)),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // author row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: hp),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.asset(authorAvatar,
                    width: 40, height: 40, fit: BoxFit.cover),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(authorName,
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Image.asset('assets/location.png',
                            width: 14, height: 14, color: Colors.black45),
                        const SizedBox(width: 4),
                        Text(locationLabel,
                            style: const TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2DA67A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Follow'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // tabs look
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: hp),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2DA67A),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Ingrident',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F4F6),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  alignment: Alignment.center,
                  child: const Text('Procedure',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // serves
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: hp),
          child: Row(
            children: [
              Image.asset('assets/bell.png',
                  width: 18, height: 18, color: Colors.black45),
              const SizedBox(width: 8),
              const Text('1 serve', style: TextStyle(color: Colors.black54)),
              const Spacer(),
              Text('${ingredients.length} items',
                  style: const TextStyle(color: Colors.black54)),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // ingredients
        ...ingredients.map((it) => _ing(hp, it.image, it.name, it.amount)),
      ],
    );
  }

  static Widget _ing(double hp, String img, String name, String amt) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hp, vertical: 6),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F6F8),
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          border: Border.all(color: const Color(0xFFE9EDF0)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 6,
                      color: Color(0x0D000000),
                      offset: Offset(0, 3))
                ],
              ),
              alignment: Alignment.center,
              child:
                  Image.asset(img, width: 32, height: 32, fit: BoxFit.contain),
            ),
            const SizedBox(width: 12),
            Text(name,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            const Spacer(),
            Text(
              amt,
              style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.45),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookmarkCircle extends StatelessWidget {
  const _BookmarkCircle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Image.asset('assets/inactive_bookmark.png', width: 16, height: 16),
    );
  }
}
