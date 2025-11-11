// lib/core/image_loader.dart
import 'package:flutter/material.dart';

class UiImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment alignment;
  final FilterQuality filterQuality;
  final Color? color;

  const UiImage(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
    this.filterQuality = FilterQuality.high,
    this.color,
  });

  bool get _isNetwork =>
      src.startsWith('http://') || src.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      return Image.network(
        src,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        filterQuality: filterQuality,
        color: color,
        errorBuilder: (_, __, ___) => _placeholder(),
      );
    }
    return Image.asset(
      src,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      filterQuality: filterQuality,
      color: color,
      errorBuilder: (_, __, ___) => _placeholder(),
    );
  }

  Widget _placeholder() => ColoredBox(
        color: const Color(0x11000000),
        child: SizedBox(width: width, height: height),
      );
}
