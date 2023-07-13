import 'package:flutter/material.dart';
import 'package:seat_finder/Utilities/colors.dart';

void showLegend(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('KEY',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textFieldTextColor,
                    fontSize: 25)),
            const SizedBox(height: 10),
            _buildLegendItem('Upper Berth', upperBerthColor),
            const SizedBox(height: 10),
            _buildLegendItem('Side Upper Berth', sideUpperBerthColor),
            const SizedBox(height: 10),
            _buildLegendItem('Lower Berth', lowerBerthColor),
            const SizedBox(height: 10),
            _buildLegendItem('Side Lower Berth', sideLowerBerthColor),
            const SizedBox(height: 10),
            _buildLegendItem('Middle Berth', middleBerthColor),
          ],
        ),
      );
    },
  );
}

Widget _buildLegendItem(String text, Color color) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: greyColor.withOpacity(0.4),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        const SizedBox(width: 5),
        Icon(Icons.color_lens, color: color),
      ],
    ),
  );
}
