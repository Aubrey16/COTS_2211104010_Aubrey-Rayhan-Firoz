import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';

class HomeView extends StatelessWidget {
  final List<String> icons = [
    "assets/icons/topup.png",
    "assets/icons/pay.png",
    "assets/icons/explore.png",
    "assets/icons/goride.png",
    "assets/icons/gocar.png",
    "assets/icons/gofood.png",
    "assets/icons/gosend.png",
    "assets/icons/more.png",
  ];

  final List<String> cards = [
    "assets/image/card1.png",
    "assets/image/card2.png",
    "assets/image/card3.png",
  ];

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              onChanged: controller.updateSearchText,
              decoration: InputDecoration(
                hintText: "Find services, food, or places",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),


            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: icons.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset(icons[index]),
                    ),
                    SizedBox(height: 5),
                    Text(
                      icons[index].split('/').last.split('.').first.capitalizeFirst!,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),


            Text(
              "Promotions",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),


            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(cards[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
