import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SplashContent(),
    );
  }
}

class SplashContent extends StatefulWidget {
  const SplashContent({Key? key}) : super(key: key);

  @override
  _SplashContentState createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> with TickerProviderStateMixin {
  // Color constants that match the design
  static const Color primaryBlue = Color(0xFF1E3D58);
  static const Color accentYellow = Color(0xFFFFB800);

  // Animation controllers
  late final AnimationController _logoController;
  late final AnimationController _starController;
  late final AnimationController _letterController;
  late final AnimationController _buttonController;
  late final AnimationController _taglineController;
  
  // Logo animations
  late final Animation<double> _logoJumpAnimation;
  late final Animation<double> _logoScaleAnimation;
  
  // Star animations
  late final Animation<double> _starRotateAnimation;
  late final Animation<double> _starScaleAnimation;
  late final Animation<double> _starBrightnessAnimation;
  
  // Individual letter animations
  late final List<Animation<double>> _letterOffsetAnimations;
  
  // Button and tagline animations
  late final Animation<double> _buttonOpacityAnimation;
  late final Animation<double> _taglineSlideAnimation;
  late final Animation<double> _taglineOpacityAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize controllers with durations
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _starController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    );
    
    _letterController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _taglineController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Configure logo jumping animation (Pixar-like bounce)
    _logoJumpAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: -40.0)
          .chain(CurveTween(curve: Curves.easeOut)),
        weight: 20.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -40.0, end: 0.0)
          .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 30.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: -20.0)
          .chain(CurveTween(curve: Curves.easeOut)),
        weight: 20.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -20.0, end: 0.0)
          .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 30.0,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.7),
      ),
    );

    // Logo scale animation with elasticity
    _logoScaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.1, end: 1.25)
          .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 60.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.25, end: 1.0)
          .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40.0,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.6),
      ),
    );

    // Star animations for dramatic entrance
    _starRotateAnimation = Tween<double>(
      begin: 0.0,
      end: 4 * pi, // Two full rotations
    ).animate(
      CurvedAnimation(
        parent: _starController,
        curve: const Interval(0.0, 0.8, curve: Curves.elasticOut),
      ),
    );
    
    _starScaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 2.0)
          .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 70.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 2.0, end: 1.0)
          .chain(CurveTween(curve: Curves.easeOut)),
        weight: 30.0,
      ),
    ]).animate(_starController);
    
    // Fixed: Changed 1.5 to 1.0 to keep opacity within valid range (0.0-1.0)
    _starBrightnessAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0)
          .chain(CurveTween(curve: Curves.easeOut)),
        weight: 30.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.7)
          .chain(CurveTween(curve: Curves.easeIn)),
        weight: 35.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.7, end: 1.0)
          .chain(CurveTween(curve: Curves.easeOut)),
        weight: 35.0,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _starController,
        curve: const Interval(0.1, 0.7),
      ),
    );

    // Create staggered letter animations
    _letterOffsetAnimations = List.generate(
      5, // Number of letters in "LibelT"
      (index) => Tween<double>(
        begin: 50.0,
        end: 0.0,
      ).animate(
        CurvedAnimation(
          parent: _letterController,
          curve: Interval(
            index * 0.1, // Staggered start
            0.6 + (index * 0.08), // Staggered end
            curve: Curves.elasticOut,
          ),
        ),
      ),
    );

    // Button fade-in animation
    _buttonOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: Curves.easeIn,
      ),
    );
    
    // Tagline animations
    _taglineSlideAnimation = Tween<double>(
      begin: 30.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _taglineController,
        curve: Curves.easeOutCubic,
      ),
    );
    
    _taglineOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _taglineController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeIn),
      ),
    );

    // Launch the animation sequence
    _startAnimationSequence();
  }

  void _startAnimationSequence() {
    // First, animate the logo
    _logoController.forward().then((_) {
      // Then, animate the individual letters
      _letterController.forward();
      
      // Then, animate the star with a small delay
      Future.delayed(const Duration(milliseconds: 200), () {
        _starController.forward();
      });
      
      // Then, fade in the tagline
      Future.delayed(const Duration(milliseconds: 500), () {
        _taglineController.forward();
      });
      
      // Finally, fade in the button
      Future.delayed(const Duration(milliseconds: 800), () {
        _buttonController.forward();
      });
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _starController.dispose();
    _letterController.dispose();
    _taglineController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(  // Added SafeArea to prevent overflow
      child: Center(
        child: SingleChildScrollView(  // Added to handle potential overflow
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated logo
              _buildAnimatedLogo(),
              
              const SizedBox(height: 20),
              
              // Animated tagline
              _buildAnimatedTagline(),
              
              const SizedBox(height: 80),  // Reduced from 120 to prevent overflow
              
              // Animated button
              _buildAnimatedButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedLogo() {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _logoController, 
        _letterController,
        _starController
      ]),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _logoJumpAnimation.value),
          child: Transform.scale(
            scale: _logoScaleAnimation.value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // L letter
                Transform.translate(
                  offset: Offset(0, _letterOffsetAnimations[0].value),
                  child: Text(
                    'L',
                    style: GoogleFonts.poppins(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                ),
                
                // i letter with star replacing the dot
                Transform.translate(
                  offset: Offset(0, _letterOffsetAnimations[1].value),
                  child: SizedBox(
                    width: 30,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Base of 'i' without the dot
                        Positioned(
                          child: Text(
                            'ı', // Using dotless i character
                            style: GoogleFonts.poppins(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: accentYellow,
                            ),
                          ),
                        ),
                        // Star instead of the dot
                        Positioned(
                          top: 15, // Adjusted to be right above the i
                          left: 4, // Centered better
                          child: Transform.rotate(
                            angle: _starRotateAnimation.value,
                            child: Transform.scale(
                              scale: _starScaleAnimation.value,
                              child: Opacity(
                                opacity: _starBrightnessAnimation.value.clamp(0.0, 1.0),
                                child: const Icon(
                                  Icons.star,
                                  size: 28, // Increased from 18 to 28
                                  color: primaryBlue,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // b letter
                Transform.translate(
                  offset: Offset(0, _letterOffsetAnimations[2].value),
                  child: Text(
                    'b',
                    style: GoogleFonts.poppins(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: accentYellow,
                    ),
                  ),
                ),
                
                // e letter
                Transform.translate(
                  offset: Offset(0, _letterOffsetAnimations[3].value),
                  child: Text(
                    'e',
                    style: GoogleFonts.poppins(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: accentYellow,
                    ),
                  ),
                ),
                
                // l letter
                Transform.translate(
                  offset: Offset(0, _letterOffsetAnimations[3].value),  // Using same animation as 'e'
                  child: Text(
                    'l',
                    style: GoogleFonts.poppins(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: accentYellow,
                    ),
                  ),
                ),
                
                // T letter
                Transform.translate(
                  offset: Offset(0, _letterOffsetAnimations[4].value),
                  child: Text(
                    'T',
                    style: GoogleFonts.poppins(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedTagline() {
    return AnimatedBuilder(
      animation: _taglineController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _taglineSlideAnimation.value),
          child: Opacity(
            opacity: _taglineOpacityAnimation.value,
            child: Text.rich(
              TextSpan(
                style: GoogleFonts.poppins(fontSize: 18),
                children: const [
                  TextSpan(text: 'Spen', style: TextStyle(color: primaryBlue)),
                  TextSpan(text: 'libel', style: TextStyle(color: accentYellow)),
                  TextSpan(text: ' Edu', style: TextStyle(color: primaryBlue)),  // Added space before Edu
                  TextSpan(text: 'Tech', style: TextStyle(color: accentYellow)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedButton() {
    return AnimatedBuilder(
      animation: _buttonController,
      builder: (context, child) {
        return Opacity(
          opacity: _buttonOpacityAnimation.value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ElevatedButton(
              onPressed: () {
                Get.offAllNamed('/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 4,
              ),
              child: Text(
                'Get Started',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}