// components/location_check_overlay.dart
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

class LocationCheckOverlay extends StatefulWidget {
  final VoidCallback onLocationCheckComplete;
  final Function(bool success, String message) onShowResult;

  const LocationCheckOverlay({
    super.key,
    required this.onLocationCheckComplete,
    required this.onShowResult,
  });

  @override
  State<LocationCheckOverlay> createState() => _LocationCheckOverlayState();
}

class _LocationCheckOverlayState extends State<LocationCheckOverlay>
    with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _loadingController;
  late Animation<double> _rotationAnimation;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  String _locationStatus = '';

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _loadingController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _loadingController,
      curve: Curves.linear,
    ));

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    // Start the location check simulation
    _startLocationCheck();
  }

  @override
  void dispose() {
    _loadingController.dispose();
    _pulseController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  // Simulate location check with loading animation
  Future<void> _startLocationCheck() async {
    setState(() {
      _locationStatus = 'Meminta izin lokasi...';
    });

    // Start animations
    _loadingController.repeat();
    _pulseController.repeat(reverse: true);
    _scaleController.forward();

    // Step 1: Simulating permission request
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      _locationStatus = 'Mencari sinyal GPS...';
    });

    // Step 2: Simulating GPS search
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      _locationStatus = 'Mengecek lokasi Anda...';
    });

    // Step 3: Simulating location verification
    await Future.delayed(const Duration(milliseconds: 1500));
    setState(() {
      _locationStatus = 'Memverifikasi area sekolah...';
    });

    // Step 4: Final check
    await Future.delayed(const Duration(milliseconds: 1000));

    // Stop animations
    _loadingController.stop();
    _pulseController.stop();
    _scaleController.reset();

    // Always success
    bool success = true;
    String message =
        'Absensi berhasil! Anda berada di area sekolah.\nJarak: 45 meter dari sekolah';

    // Call the completion callback
    widget.onLocationCheckComplete();

    // Show result after a short delay
    await Future.delayed(const Duration(milliseconds: 300));
    widget.onShowResult(success, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Rotating location icon with glow effect
                    AnimatedBuilder(
                      animation: _rotationAnimation,
                      builder: (context, child) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Transform.rotate(
                            angle: _rotationAnimation.value,
                            child: Icon(
                              Icons.location_searching,
                              size: 56,
                              color: Colors.blue[600],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Pulsing title text
                    AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _pulseAnimation.value,
                          child: Text(
                            'Mengecek Lokasi',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),

                    // Status text with fade animation
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        _locationStatus,
                        key: ValueKey(_locationStatus),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Custom loading indicator
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Stack(
                        children: [
                          // Background circle
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.1),
                            ),
                          ),
                          // Animated progress indicator
                          CircularProgressIndicator(
                            strokeWidth: 4,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.blue[600]!,
                            ),
                            backgroundColor: Colors.blue.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
