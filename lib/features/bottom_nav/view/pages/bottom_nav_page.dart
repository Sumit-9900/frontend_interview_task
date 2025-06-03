import 'package:flutter/material.dart';
import 'package:frontend_interview_task/core/constants/app_constants.dart';
import 'package:frontend_interview_task/features/home/view/pages/bonfire_page.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BonfirePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppConstants.pokerCardImage),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppConstants.bonfireImage),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppConstants.chatImage),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppConstants.userImage),
            label: '',
          ),
        ],
      ),
    );
  }
}
