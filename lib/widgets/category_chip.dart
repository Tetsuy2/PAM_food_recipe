import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final String asset;
  final bool selected;
  final VoidCallback onTap;
  const CategoryChip({
    super.key,
    required this.label,
    required this.asset,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 92,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : const Color(0xFFF1F4F6),
          borderRadius: BorderRadius.circular(14),
          boxShadow: selected
              ? const [
                  BoxShadow(
                      blurRadius: 12,
                      color: Color(0x11000000),
                      offset: Offset(0, 6))
                ]
              : null,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Image.asset(asset, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
