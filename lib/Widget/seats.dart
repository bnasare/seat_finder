import 'package:flutter/material.dart';
import 'package:seat_finder/Utilities/colors.dart';

class SeatsWidgets extends StatefulWidget {
  final int? selectedSeatNumber;

  const SeatsWidgets({
    Key? key,
    this.selectedSeatNumber,
  }) : super(key: key);

  @override
  _SeatsWidgetsState createState() => _SeatsWidgetsState();
}

class _SeatsWidgetsState extends State<SeatsWidgets> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSeat(int seatNumber) {
    final double scrollPosition = (seatNumber - 5) * 13.5;

    _scrollController.animateTo(
      scrollPosition,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildSeat(int number, Color color) {
    Color seatBorderColor = color;
    Color seatFillColor = transparentColor;

    if ([15, 23, 31, 39, 47].contains(number)) {
      seatBorderColor = sideLowerBerthColor;
    }

    if ((number == 15 ||
            number == 23 ||
            number == 31 ||
            number == 39 ||
            number == 47) &&
        number == widget.selectedSeatNumber) {
      seatBorderColor = blackColor;
      seatFillColor = sideLowerBerthColor;
      scrollToSeat(number);
    } else if (number == widget.selectedSeatNumber) {
      seatBorderColor = blackColor;
      seatFillColor = color;
      scrollToSeat(number);
    }

    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        color: seatFillColor,
        border: Border.all(color: seatBorderColor),
      ),
      child: Center(child: Text(number.toString())),
    );
  }

  Widget _buildRow(List<int> seatNumbers, List<Color> seatColors) {
    return SizedBox(
      child: Row(
        children: [
          for (int i = 0; i < seatNumbers.length; i++) ...[
            _buildSeat(seatNumbers[i], seatColors[i]),
            if (i == 2) const Spacer(),
            if (i == seatNumbers.length - 2) const Spacer(),
            if (i < seatNumbers.length - 1) const SizedBox(width: 5),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final seatColor = [
      upperBerthColor,
      middleBerthColor,
      lowerBerthColor,
      sideUpperBerthColor,
      sideLowerBerthColor,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            width: size.width * 0.85,
            child: Column(
              children: [
                _buildRow([1, 2, 3, 7], seatColor),
                const SizedBox(height: 30),
                _buildRow([4, 5, 6, 8], seatColor),
                const SizedBox(height: 5),
                _buildRow([9, 10, 11, 15], seatColor),
                const SizedBox(height: 30),
                _buildRow([12, 13, 14, 16], seatColor),
                const SizedBox(height: 5),
                _buildRow([17, 18, 19, 23], seatColor),
                const SizedBox(height: 30),
                _buildRow([20, 21, 22, 24], seatColor),
                const SizedBox(height: 5),
                _buildRow([25, 26, 27, 31], seatColor),
                const SizedBox(height: 30),
                _buildRow([28, 29, 30, 32], seatColor),
                const SizedBox(height: 5),
                _buildRow([33, 34, 35, 39], seatColor),
                const SizedBox(height: 30),
                _buildRow([36, 37, 38, 40], seatColor),
                const SizedBox(height: 5),
                _buildRow([41, 42, 43, 47], seatColor),
                const SizedBox(height: 30),
                _buildRow([44, 45, 46, 48], seatColor),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
