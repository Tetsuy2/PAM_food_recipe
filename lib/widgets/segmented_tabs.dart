// lib/widgets/segmented_tabs.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';

class SegmentedTabs extends StatelessWidget {
  final List<String> tabs;
  final String active;
  final ValueChanged<String> onChanged;

  const SegmentedTabs({
    super.key,
    required this.tabs,
    required this.active,
    required this.onChanged,
  });

  static const _green = Color(0xFF2DA67A);
  static const _height = 36.0;
  static const _radius = 8.0;
  static const _fontSize = 15.0;

  @override
  Widget build(BuildContext context) {
    // all chips get the same width
    const textStyle = TextStyle(
      fontSize: _fontSize,
      fontWeight: FontWeight.w700,
    );
    double maxText = 0;
    for (final t in tabs) {
      final tp = TextPainter(
        text: TextSpan(text: t, style: textStyle),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      )..layout();
      maxText = math.max(maxText, tp.width);
    }
    final double itemWidth = maxText + 24;

    return SizedBox(
      height: _height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final t = tabs[i];
          final selected = t == active;
          return GestureDetector(
            onTap: () => onChanged(t),
            child: Container(
              width: itemWidth,
              height: _height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? _green : Colors.transparent,
                borderRadius: BorderRadius.circular(_radius),
              ),
              child: Text(
                t,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: _fontSize,
                  color: selected ? Colors.white : _green,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
