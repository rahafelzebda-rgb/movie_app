import 'package:flutter/material.dart';
import 'package:movie_app/common/theme/app_colors.dart';
import 'package:movie_app/common/widgets/primary_buttom.dart';
import 'package:movie_app/common/widgets/secondary_buttom.dart';
import 'package:movie_app/screens/onboarding/onbording_data.dart';
import 'package:movie_app/screens/onboarding/onbording_item.dart';

class OnboardingScreen extends StatefulWidgflutter pub getet {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  int currentIndex = 0;
  void nextPage() {
    if (currentIndex < onbordingList.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      //TODO: Navigate to login
    }
  }

  void previousPage() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onbordingList.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },

            itemBuilder: (context, index) {
              return OnbordingItem(data: onbordingList[index], index: index);
            },
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              children: [
                PrimaryButtom(
                  text: onbordingList[currentIndex].buttomText,
                  onPressed: nextPage,
                ),
                if (currentIndex >= 2) ...[
                  const SizedBox(height: 10),
                  SecondaryButton(text: "Back", onPressed: previousPage),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
