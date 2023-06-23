import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySplashPage extends StatelessWidget {
  const MySplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // bool isLoggedIn = checkUserLoggedIn();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      bool introPage = prefs.getBool('introPage') ?? true;

      if (kDebugMode) {
        print('intro :  $introPage');
      }

      if (introPage) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/onboard');
      } else if (isLoggedIn) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Help Desk",
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Your customer doesn’t care how much you know until they know how much you care",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                ),
                Lottie.asset('assets/lottie/help-desk.json'),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'IT',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'RS GADING PLUIT',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.ltr,
                        overflow: TextOverflow.fade, // atau TextOverflow.fade
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // Text(
                      //   'PLUIT',
                      //   style: TextStyle(
                      //     fontSize: 30,
                      //     color: Colors.red,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
