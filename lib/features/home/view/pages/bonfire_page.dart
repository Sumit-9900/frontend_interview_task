import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend_interview_task/core/constants/app_constants.dart';
import 'package:frontend_interview_task/core/theme/app_colors.dart';
import 'package:frontend_interview_task/features/home/models/question.dart';
import 'package:frontend_interview_task/features/home/view/widgets/question_button.dart';
import 'package:frontend_interview_task/features/home/view/widgets/reusable_row.dart';
import 'package:frontend_interview_task/features/home/viewmodel/cubit/question_cubit.dart';

class BonfirePage extends StatelessWidget {
  const BonfirePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AppConstants.backgroundImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Text(
                                'Stroll Bonfire',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 0.32
                                    ..color = Color(0xFFB3ADF6),
                                ),
                              ),
                              Text(
                                'Stroll Bonfire',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34,
                                  color: Color(0xffCCC8FF),
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: Offset(0, 0),
                                      blurRadius: 7.9,
                                    ),
                                    Shadow(
                                      color: Color(0xFFBEBEBE),
                                      offset: Offset(0, 0),
                                      blurRadius: 2,
                                    ),
                                    Shadow(
                                      color: Color(0xFF24232F).withOpacity(0.5),
                                      offset: Offset(0, 1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 6),
                          Image.asset(
                            AppConstants.arrowDownImage,
                            fit: BoxFit.cover,
                            width: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableRow(
                            image: AppConstants.timerImage,
                            label: '22h 00m',
                            sizedBox: const SizedBox(width: 6),
                          ),
                          const SizedBox(width: 5),
                          ReusableRow(
                            image: AppConstants.userImage,
                            label: '103',
                            width: 25,
                            sizedBox: const SizedBox(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  top: screenWidth + 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(
                            AppConstants.joeyUserImage,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: screenWidth - 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Angelina, 28',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                color: AppColors.whiteSmokeColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'What is your favorite time of the day?',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: AppColors.whiteSmokeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45),
            Text(
              '“Mine is definitely the peace in the morning.”',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Color(0xFFCBC9FF),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              direction: Axis.horizontal,
              children: questions.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;

                return GestureDetector(
                  onTap: () {
                    context.read<QuestionCubit>().changeQuestion(index);
                  },
                  child: BlocSelector<QuestionCubit, QuestionState, int>(
                    selector: (state) {
                      if (state is QuestionChanged) {
                        return state.index;
                      }
                      return 3;
                    },
                    builder: (context, selectedIndex) {
                      bool isSelected = selectedIndex == index;
                      return QuestionButton(
                        question: question,
                        isSelected: isSelected,
                      );
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pick your option.\nSee who has a similar mind.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xffE5E5E5),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(AppConstants.micImage, fit: BoxFit.cover),
                      const SizedBox(width: 5),
                      Image.asset(
                        AppConstants.arrowRightCircleImage,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
