import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyIntroPage extends StatelessWidget {
  const MyIntroPage({super.key});

  // void _onIntroEnd(context) {
  //   Navigator.of(context).pushReplacement(
  //     MaterialPageRoute(builder: (_) => const MyOnboardPage()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w700),
      bodyPadding: EdgeInsets.all(16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
            title: "Fractional shares",
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: Image.asset('assets/images/1.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Fractional shares",
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: Image.asset('assets/images/2.png'),
            decoration: pageDecoration),
        PageViewModel(
            title: "Fractional shares",
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: Image.asset('assets/images/3.png'),
            decoration: pageDecoration),
        PageViewModel(
          title: "Fractional shares",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: Image.asset('assets/images/5.png'),
          decoration: pageDecoration,
          // footer: ElevatedButton(
          //   onPressed: () {},
          //   child: const Text(
          //     "Get Started",
          //     style: TextStyle(
          //       fontSize: 14.0,
          //     ),
          //   ),
          // ),
        )
      ],
      onDone: () async {
        savePrevIntro();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool introPage = prefs.getBool('introPage') ?? false;

        if (kDebugMode) {
          print('intro :  $introPage');
        }
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/login');
      },
      onSkip: () {
        savePrevIntro();
        Navigator.pushReplacementNamed(context, '/login');
      },

      showSkipButton: false,
      skipOrBackFlex: 0,
      showNextButton: true,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Colors.grey,
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }

  void savePrevIntro() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setBool('introPage', false);
  }
}
