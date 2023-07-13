import 'package:flutter/material.dart';
import 'package:seat_finder/Widget/seats.dart';
import 'package:seat_finder/Widget/app_bar.dart';
import 'package:seat_finder/Widget/search_box.dart';
import 'package:seat_finder/Widget/Reusable%20widgets/snackbar_message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int? selectedSeatNumber;

  void searchButtonPressed() {
    final enteredText = _searchController.text.trim();

    final hasLetters = RegExp(r'[A-Za-z]').hasMatch(enteredText);

    if (hasLetters) {
      showSnackBar(context, 'Invalid input. Please enter only numbers.');
    } else {
      final enteredNumber = int.tryParse(enteredText);

      setState(() {
        selectedSeatNumber = enteredNumber;
      });

      if (enteredNumber != null && (enteredNumber < 1 || enteredNumber > 48)) {
        showSnackBar(context, 'No corresponding seat number.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBarWidget(),
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            SearchBoxWidget(
              controller: _searchController,
              onSearchPressed: searchButtonPressed,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SeatsWidgets(selectedSeatNumber: selectedSeatNumber),
            ),
          ],
        ),
      ),
    );
  }
}
