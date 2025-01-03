import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';
import 'home_view.dart';
import 'promo_view.dart';
import 'pesanan_view.dart';

class MainView extends StatelessWidget {
  final List<Widget> pages = [
    HomeView(),
    PromoView(),
    PesananView(),
  ];

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find();

    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.updateIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: "Promo",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Pesanan",
            ),
          ],
        ),
      ),
    );
  }
}
