import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

class MyOnboardPage extends StatefulWidget {
  const MyOnboardPage({super.key});

  @override
  State<MyOnboardPage> createState() => _MyOnboardPageState();
}

class _MyOnboardPageState extends State<MyOnboardPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoard(
          onSkip: () {
            // print('skipped');
          },
          // Either Provide onDone Callback or nextButton Widget to handle done state
          onDone: () {
            // print('done tapped');
          },
          onBoardData: onBoardData,
          titleStyles: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.15,
          ),
          descriptionStyles: TextStyle(
            fontSize: 16,
            color: Colors.brown.shade300,
          ),
          skipButton: TextButton(
            onPressed: () {
              // print('skipButton pressed');
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
          ),
          nextButton: OnBoardConsumer(
            builder: (context, ref, child) {
              final state = ref.watch(onBoardStateProvider);
              return InkWell(
                onTap: () => _onNextTap(state),
                child: Container(
                  width: 230,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Colors.redAccent, Colors.deepOrangeAccent],
                    ),
                  ),
                  child: Text(
                    state.isLastPage ? "Done" : "Next",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          pageIndicatorStyle: const PageIndicatorStyle(
            width: 100,
            inactiveColor: Colors.deepOrangeAccent,
            activeColor: Colors.deepOrange,
            inactiveSize: Size(8, 8),
            activeSize: Size(12, 12),
          ),
          pageController: _pageController),
    );
  }

  void _onNextTap(OnBoardState onBoardState) {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
    }
  }
}

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Set your own goals and get better",
    description: "Goal support your motivation and inspire you to work harder",
    imgUrl: "assets/images/1.png",
  ),
  const OnBoardModel(
    title: "Track your progress with statistics",
    description:
        "Analyse personal result with detailed chart and numerical values",
    imgUrl: 'assets/images/2.png',
  ),
  const OnBoardModel(
    title: "Create photo comparision and share your results",
    description:
        "Take before and after photos to visualize progress and get the shape that you dream about",
    imgUrl: 'assets/images/3.png',
  ),
  const OnBoardModel(
    title: "Create photo comparision and share your results",
    description:
        "Take before and after photos to visualize progress and get the shape that you dream about",
    imgUrl: 'assets/images/4.png',
  ),
  const OnBoardModel(
    title: "Create photo comparision and share your results",
    description:
        "Take before and after photos to visualize progress and get the shape that you dream about",
    imgUrl: 'assets/images/5.png',
  ),
];
