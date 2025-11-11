import 'package:flutter/material.dart';
import '../core/image_loader.dart';

class IngredientTileData {
  final String image;
  final String name;
  final String amount;
  const IngredientTileData({
    required this.image,
    required this.name,
    required this.amount,
  });
}

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({
    super.key,
    required this.title,
    required this.bannerImage,
    required this.gradientOverlay,
    required this.rating,
    required this.timeLabel,
    required this.authorName,
    required this.authorAvatar,
    required this.locationLabel,
    required this.reviewsLabel,
    required this.ingredients,
    this.steps = const [],
  });

  final String title;
  final String bannerImage;
  final String gradientOverlay;
  final double rating;
  final String timeLabel;
  final String authorName;
  final String authorAvatar;
  final String locationLabel;
  final String reviewsLabel;
  final List<IngredientTileData> ingredients;
  final List<String> steps;

  static const _green = Color(0xFF2DA67A);

  @override
  Widget build(BuildContext context) {
    const double side = 24.0;
    const double bannerRadius = 18.0;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // the banner
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(side, 8, side, 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => Navigator.pop(context),
                    splashRadius: 22,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {},
                    splashRadius: 22,
                  ),
                ],
              ),
            ),
          ),

          // Banner
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: side),
              child: Stack(
                children: [
                  // Image + gradient
                  ClipRRect(
                    borderRadius: BorderRadius.circular(bannerRadius),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: UiImage(bannerImage, fit: BoxFit.cover),
                        ),
                        Positioned.fill(
                          child: IgnorePointer(
                            ignoring: true,
                            child: UiImage(
                              gradientOverlay,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Rating pill
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1D6),
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
                          const UiImage('assets/star.png',
                              width: 13, height: 13),
                          const SizedBox(width: 6),
                          Text(
                            rating.toStringAsFixed(1),
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom-right cluster: time + save icon
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Row(
                      children: [
                        // time
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              const UiImage('assets/timer.png',
                                  width: 14, height: 14, color: Colors.white),
                              const SizedBox(width: 6),
                              Text(
                                timeLabel,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        // save/bookmark
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                color: Color(0x11000000),
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: const UiImage('assets/inactive_bookmark.png',
                              width: 18, height: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Title + reviews
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(side, 16, side, 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title.contains('\n')
                          ? title
                          : title.replaceFirst(
                              ' with ', '\nwith '), // 2 lines if needed
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          height: 1.2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    reviewsLabel,
                    style: const TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),

          // Author row + Follow button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(side, 6, side, 14),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: UiImage(authorAvatar,
                        width: 40, height: 40, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(authorName,
                            style:
                                const TextStyle(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 14, color: Colors.black38),
                            const SizedBox(width: 4),
                            Text(
                              locationLabel,
                              style: const TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: _green,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {},
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text('Follow',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tabs (Ingredient / Procedure) – simple static shell; keep existing tab bloc
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(side, 6, side, 6),
              child: Row(
                children: [
                  Expanded(
                    child: _pill(label: 'Ingredient', active: true),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _pill(label: 'Procedure', active: false),
                  ),
                ],
              ),
            ),
          ),

          // Meta top row under tabs
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(side, 6, side, 10),
              child: Row(
                children: [
                  _meta(icon: Icons.rice_bowl_outlined, label: '1 serve'),
                  Spacer(),
                  _meta(icon: Icons.list_alt_outlined, label: '4 items'),
                ],
              ),
            ),
          ),

          // Ingredients list
          SliverList.separated(
            itemCount: ingredients.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final it = ingredients[i];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: side),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F7FA),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 8,
                              color: Color(0x12000000),
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: UiImage(it.image,
                            width: 28, height: 28, fit: BoxFit.contain),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(it.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.w700)),
                      ),
                      Text(it.amount,
                          style: const TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
              );
            },
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  static Widget _pill({required String label, required bool active}) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: active ? _green : const Color(0xFFF0F3F6),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _meta extends StatelessWidget {
  const _meta({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.black38),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}
