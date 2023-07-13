import 'package:flutter/material.dart';
import 'package:seat_finder/Utilities/colors.dart';
import 'package:seat_finder/Widget/Reusable%20widgets/legend.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Seat Finder',
        style: TextStyle(
          fontFamily: "cambria",
          fontWeight: FontWeight.w600,
          fontSize: 40,
          letterSpacing: 3,
          color: textColor,
        ),
      ),
      backgroundColor: appBarColor,
      toolbarHeight: 100,
      actions: [
        GestureDetector(
          onTap: () {
            showLegend(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Image.asset('assets/images/filter.png'),
          ),
        ),
      ],
    );
  }
}
