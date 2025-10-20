import 'package:flutter/material.dart';

class SearchBarX extends StatelessWidget {
  const SearchBarX({super.key});

  @override
  Widget build(BuildContext context) {
    const iconSize = 20.0;

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE4E7EB)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Image.asset('assets/search-normal.png',
                    width: iconSize, height: iconSize, color: Colors.black45),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      hintText: 'Search recipe',
                      hintStyle: TextStyle(color: Colors.black45),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xFF2DA67A),
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 20,
                  color: Color(0x14000000),
                  offset: Offset(0, 8)),
            ],
          ),
          alignment: Alignment.center,
          child: Image.asset('assets/setting.png',
              width: iconSize, height: iconSize, color: Colors.white),
        ),
      ],
    );
  }
}
