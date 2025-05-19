import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'login_register.dart';
import 'home_screen.dart';

void main() {
  // Initialize date formatting for Indonesian locale
  Intl.defaultLocale = 'id_ID';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashWithImageFade(),
    );
  }
}

class SplashWithImageFade extends StatefulWidget {
  const SplashWithImageFade({super.key});

  @override
  State<SplashWithImageFade> createState() => _SplashWithImageFadeState();
}

class _SplashWithImageFadeState extends State<SplashWithImageFade>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    // Delay 1000ms before logo appears
    Future.delayed(const Duration(milliseconds: 1000), () {
      _controller.forward();
    });

    // Navigate to LoginScreen after splash finishes (3 seconds total)
    Timer(const Duration(milliseconds: 3000), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282C2B),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF8DD3D3), // Turquoise background
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text(
                "M",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
