import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/custom_button.dart';
import 'package:cots/design_system/app_color.dart';

class OnboardingView extends StatelessWidget {


  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/image/onboard1.png',
      'title': 'Selamat datang di Gojek',
      'description': '''Aplikasi yang bikin hidupmu lebih nyaman. Siap
bantuin semua kebutuhan mu, kapanpun, dan di manapun''',
    },
    {
      'image': 'assets/image/onboard2.png',
      'title': 'Transportasi & logistik',
      'description': '''Antarin kamu jalan atau ambilin barang lebih
gampang tinggal ngeklik doang~''',
    },
    {
      'image': 'assets/image/onboard3.png',
      'title': 'Pesan makan & belanja',
      'description': 'Lagi ngidam sesuatu? Gojek beliin gak pakai lama.',
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
                        fontFamily: 'Sf-Pro-Text-Bold',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textBlack,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      onboardingData[index]['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'SF-Pro-Text-light',
                        fontSize: 16,
                        color: AppColors.textGrey,
                      ),
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
              Get.toNamed('/login');
            },
            isPrimary: false,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
