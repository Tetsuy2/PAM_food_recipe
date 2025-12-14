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

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF2DA67A);
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: tabs.map((t) {
          final sel = t == active;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Material(
                color: sel ? green : Colors.transparent,
                elevation: 0,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => onChanged(t),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        t,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: sel ? Colors.white : green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
