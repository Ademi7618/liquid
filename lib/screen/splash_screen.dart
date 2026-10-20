import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid/app/app_localizations.dart';
import 'package:liquid/screen/login_screen.dart';
import 'dart:ui';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: -50, left: -50, child: _buildWaterBlob(200, 200, const Color(0xFF8AE9FF).withOpacity(0.5))),
          Positioned(bottom: -60, right: -60, child: _buildWaterBlob(250, 250, const Color(0xFF52C4FF).withOpacity(0.4))),
          Center(
            child: Container(
              width: 340,
              height: 420,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.7), Colors.white.withOpacity(0.3)],
                ),
                border: Border.all(width: 1.5, color: Colors.white.withOpacity(0.8)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RotationTransition(
                          turns: _controller,
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: Stack(
                              alignment: Alignment.center,
                              children: List.generate(8, (index) {
                                double angle = (index * pi / 4);
                                return Transform.translate(
                                  offset: Offset(22 * cos(angle), 22 * sin(angle)),
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFF0072FF).withOpacity(0.15 + (index * 0.1)),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(t.translate('loading'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0D3B66))),
                        const SizedBox(height: 8),
                        Text(t.translate('wait'), style: TextStyle(fontSize: 12, color: const Color(0xFF0D3B66).withOpacity(0.6))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterBlob(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}