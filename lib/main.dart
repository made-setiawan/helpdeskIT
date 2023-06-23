import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpdesk_rsgp/pages/home.dart';
import 'package:helpdesk_rsgp/pages/intro.dart';
import 'package:helpdesk_rsgp/pages/login.dart';
import 'package:helpdesk_rsgp/pages/splash.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.grey,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.grey[300], // Atur warna latar belakang AppBar di sini
        ),
      ),
      home: const MySplashPage(),
      routes: {
        '/splash': (context) => const MySplashPage(),
        '/onboard': (context) => const MyIntroPage(),
        '/login': (context) => const MyLoginPage(),
        '/home': (context) => const MyHomePage(),
      },
    );
  }
}
