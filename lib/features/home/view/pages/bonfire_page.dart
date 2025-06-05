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
    final screenHeight = MediaQuery.of(context).size.height;
    final adaptiveHeight = (screenHeight * 0.07).clamp(20.0, 50.0);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0F1115), // 0%
                  Color(0xFF0D0E12), // 28%
                  Color(0xFF0B0C0F), // 64%
                  Color(0xFF090B0D), // 80%
                  Color(0xFF000000), // 100%
                ],
                stops: [0.0, 0.28, 0.64, 0.80, 1.0],
              ),
            ),
          ),

          // Layer 2: Radial Gradient Overlay
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [
                  Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF000000),
                  Color(0xFF000000),
                ],
                stops: [0.15, 0.3573, 0.45, 0.65, 0.8],
              ),
            ),
          ),

          // Layer 3: Top-to-Bottom Black Shadow Overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF000000), // Fully opaque black
                  Color(0xFF000000), // Fully opaque black
                  Color(0xFF000000), // Fully opaque black
                ],
                stops: [0.4, 0.1234, 0.0],
              ),
            ),
          ),
          SingleChildScrollView(
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
                    // Gradient to fade image into background color
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black],
                            stops: [0.7, 1.0],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Stack(
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
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ),
                                            offset: Offset(0, 0),
                                            blurRadius: 7.9,
                                          ),
                                          Shadow(
                                            color: Color(0xFFBEBEBE),
                                            offset: Offset(0, 0),
                                            blurRadius: 2,
                                          ),
                                          Shadow(
                                            color: Color(
                                              0xFF24232F,
                                            ).withOpacity(0.5),
                                            offset: Offset(0, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Shadow layer
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 40,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  // Border (stroke) layer
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 40,
                                    color: const Color(
                                      0xffCBC9FF,
                                    ), // Border color
                                  ),
                                  // Top layer (inner color)
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size:
                                        35, // Slightly smaller to simulate inner fill
                                    color: const Color(
                                      0xffCCC8FF,
                                    ), // Inner icon color
                                  ),
                                ],
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
                              ),
                              const SizedBox(width: 12),
                              ReusableRow(
                                image: AppConstants.personImage,
                                label: '103',
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
                            radius: 35,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 30,
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
                                const SizedBox(height: 10),
                                Stack(
                                  children: [
                                    Text(
                                      'Angelina, 28',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 0.1
                                          ..color =
                                              Colors.black, // Border color
                                      ),
                                    ),
                                    Text(
                                      'Angelina, 28',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                        color: AppColors.whiteSmokeColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
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
                SizedBox(height: adaptiveHeight),
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
        ],
      ),
    );
  }
}
