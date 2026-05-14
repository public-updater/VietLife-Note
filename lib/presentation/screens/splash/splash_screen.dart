import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/core/utils/responsive.dart';
import 'package:vietlife_note/presentation/screens/main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: Center(
          child: Builder(
            builder: (context) {
              Responsive.init(context);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: Responsive.scale(120),
                    height: Responsive.scale(120),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.calendar_today,
                      size: Responsive.scale(60),
                      color: Colors.blue,
                    ),
                  )
                      .animate()
                      .scale(duration: 600.ms, curve: Curves.easeOut)
                      .fadeIn(),
                  
                  const SizedBox(height: 32),
              
              // App Name
              Text(
                AppConstants.appName,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 600.ms),
              
                  const SizedBox(height: 8),
                  
                  // Tagline
                  Text(
                    'Quản lý cuộc sống - Ghi nhớ khoảnh khắc',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                  )
                      .animate()
                      .fadeIn(delay: 500.ms, duration: 600.ms),
                  
                  const SizedBox(height: 48),
                  
                  // Loading Indicator
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                      .animate()
                      .fadeIn(delay: 700.ms),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
