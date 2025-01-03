import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/custom_button.dart';
import 'package:cots/design_system/app_color.dart';

class OnboardingView extends StatelessWidget {
  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/image/onboard1.png',
      'title': 'Selamat datang di aplikasi!',
      'description': 'Aplikasi yang membuat hidup Anda lebih mudah.',
    },
    {
      'image': 'assets/image/onboard2.png',
      'title': 'Transportasi Mudah',
      'description': 'Pesan transportasi hanya dengan beberapa klik.',
    },
    {
      'image': 'assets/image/onboard3.png',
      'title': 'Belanja Cepat',
      'description': 'Belanja kebutuhan Anda dengan mudah.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.find();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: controller.updatePage,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(onboardingData[index]['image']!),
                    SizedBox(height: 20),
                    Text(
                      onboardingData[index]['title']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      onboardingData[index]['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.textGrey),
                    ),
                  ],
                );
              },
            ),
          ),
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 10,
                  width: controller.currentPage.value == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? AppColors.primaryGreen
                        : AppColors.textGrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 20),
          CustomButton(
            text: "Masuk",
            onPressed: () {

              Get.toNamed('/login');
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            text: "Belum ada akun?, Daftar dulu",
            onPressed: () {
              // Navigasi ke halaman daftar
              Get.toNamed('/register');
            },
            isPrimary: false,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
