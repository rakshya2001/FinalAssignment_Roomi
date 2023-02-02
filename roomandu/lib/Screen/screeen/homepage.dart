import 'package:flutter/material.dart';
import 'package:roomandu/Screen/screeen/widget/best_offer.dart';
import 'package:roomandu/Screen/screeen/widget/categories.dart';
import 'package:roomandu/Screen/screeen/widget/custom_app_bar.dart';
import 'package:roomandu/Screen/screeen/widget/custom_bottom_navigation_bar.dart';
import 'package:roomandu/Screen/screeen/widget/recommended_house.dart';
import 'package:roomandu/Screen/screeen/widget/search_input.dart';
import 'package:roomandu/Screen/screeen/widget/welcome_text.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(),
            SearchInput(),
            Categories(),
            RecommendedHouse(),
            BestOffer()
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}