import 'package:flutter/material.dart';
import 'package:frontend_interview_task/core/theme/app_colors.dart';
import 'package:frontend_interview_task/features/home/models/question.dart';

class QuestionButton extends StatelessWidget {
  final Question question;
  final bool isSelected;
  const QuestionButton({
    super.key,
    required this.question,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: (screenWidth - 36) / 2,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF232A2E),
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: AppColors.lightPurpleColor, width: 2)
            : null,
        boxShadow: const [
          BoxShadow(
            color: Color(0x4D000000),
            offset: Offset(2, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.lightPurpleColor : null,
              border: Border.all(
                color: isSelected ? AppColors.lightPurpleColor : Colors.white,
              ),
            ),
            child: Center(
              child: Text(
                question.option,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: isSelected ? Colors.white : AppColors.buttonTextColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              question.label,
              style: TextStyle(
                color: AppColors.buttonTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
