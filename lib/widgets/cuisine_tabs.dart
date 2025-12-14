import 'package:flutter/material.dart';

class CuisineTabs extends StatelessWidget {
  final List<String> tabs;
  final String active;
  final ValueChanged<String> onChanged;
  const CuisineTabs({
    super.key,
    required this.tabs,
    required this.active,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF2DA67A);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: tabs.map((t) {
        final sel = t == active;
        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => onChanged(t),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: sel
                ? BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color(0x14000000),
                        offset: Offset(0, 6),
                      )
                    ],
                  )
                : null,
            child: Text(
              t,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: sel ? Colors.white : green.withValues(alpha: 0.55),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
