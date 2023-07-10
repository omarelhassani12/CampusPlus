import 'package:flutter/material.dart';
import 'package:school_app/utils/colors.dart';

class StatisticCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;
  final bool isSelected;

  const StatisticCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.count,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardColor = isSelected ? ColorsApp.accentClr : ColorsApp.whiteClr;
    final textColor = isSelected ? ColorsApp.whiteClr : ColorsApp.mainClr;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: ColorsApp.accentClr.withOpacity(0.3),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: textColor,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
