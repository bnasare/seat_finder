import 'package:flutter/material.dart';
import 'package:seat_finder/Utilities/colors.dart';

class SearchBoxWidget extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSearchPressed;
  final VoidCallback onClearPressed; // Add this callback function.

  const SearchBoxWidget({
    Key? key,
    required this.controller,
    required this.onSearchPressed,
    required this.onClearPressed, // Pass the callback function as a parameter.
  }) : super(key: key);

  @override
  _SearchBoxWidgetState createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  bool isButtonClickable = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(textFieldListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(textFieldListener);
    super.dispose();
  }

  void textFieldListener() {
    setState(() {
      isButtonClickable = widget.controller.text.isNotEmpty;
    });
  }

  void clearSearch() {
    widget.controller.clear();
    setState(() {
      isButtonClickable = false;
    });
    widget.onClearPressed();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width * 0.85,
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: widget.controller,
              style: const TextStyle(
                color: textFieldTextColor,
                fontSize: 25,
                letterSpacing: 1,
                fontWeight: FontWeight.w400,
                fontFamily: 'BLASTER',
              ),
              decoration: InputDecoration(
                hintText: 'Enter the seat number',
                hintStyle: const TextStyle(
                  color: hintTextColor,
                  fontFamily: 'BLASTER',
                  letterSpacing: 3,
                  fontSize: 23,
                ),
                prefixIcon: const Icon(Icons.search, size: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: isButtonClickable ? widget.onSearchPressed : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonClickable ? blueColor : greyColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    minimumSize: const Size(120, 50),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BLASTER',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Visibility(
                  visible: widget.controller.text.isNotEmpty,
                  child: ElevatedButton(
                    onPressed: clearSearch,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greyColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: const Size(120, 50),
                    ),
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BLASTER',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
