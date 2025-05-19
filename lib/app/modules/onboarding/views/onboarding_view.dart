import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = ['assets/onboarding/intro1.png', 'assets/onboarding/introdua.png'];
    final titles = [
      'Selamat datang di LibelTech! Siap untuk petualangan belajar yang seru?',
      'Dengan LibelTech, kamu bisa belajar kapan saja, di mana saja!'
    ];
    final descriptions = [
      'Belajar jadi lebih mudah dan menyenangkan! Mari mulai perjalananmu dan temukan cara baru untuk memahami setiap materi dengan lebih seru!',
      'Ayo tingkatkan ilmu dan capai impianmu bersama kami! Dapatkan pengalaman belajar yang fleksibel, efektif, dan pastinya menyenangkan!'
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        final index = controller.pageIndex.value;
        
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Status bar area
                SizedBox(height: 20),
                
                // Image container
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Image.asset(
                      images[index],
                      width: MediaQuery.of(context).size.width * 4,
                      height: MediaQuery.of(context).size.height * 4,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                
                // Text content
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          titles[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E3D58),
                            height: 1.3,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          descriptions[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16, // Ukuran teks diperbesar agar lebih mudah dibaca
                            color: Color(0xFF1E3D58),
                            height: 1.5,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Indicator and buttons
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  child: Column(
                    children: [
                      // Indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 2; i++)
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              width: i == index ? 24 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: i == index 
                                    ? Color(0xFF1E3D58) 
                                    : Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 32),
                      
                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Skip button
                          TextButton(
                            onPressed: controller.skip,
                            style: TextButton.styleFrom(
                              minimumSize: Size(80, 48),
                            ),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF1E3D58),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          
                          // Next button
                          ElevatedButton(
  onPressed: () {
    if (index == 1) {
      Get.offAllNamed('/register');
    } else {
      controller.pageIndex.value++;
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF1E3D58),
    minimumSize: Size(100, 48),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  child: Text(
    index == 1 ? 'Mulai' : 'Next',
    style: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5,
    ),
  ),
),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}