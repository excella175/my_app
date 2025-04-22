import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

    // Delay 600ms sebelum logo muncul
    Future.delayed(const Duration(milliseconds: 1000), () {
      _controller.forward();
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
          child: Image.asset('assets/images/matpres_logo.jpg', width: 150),
        ),
      ),
    );
  }
}
