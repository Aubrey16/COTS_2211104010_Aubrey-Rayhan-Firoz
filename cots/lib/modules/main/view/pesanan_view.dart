import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesananView extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {
      "title": "Ayam Benjoss, kedungkandang",
      "items": "3 item",
      "details": "2 Paket Ayam Bakar Jumbo",
      "time": "28 Des 11:36",
      "price": "Rp.58.800"
    },
    {
      "title": "Ayam Benjoss, kedungkandang",
      "items": "3 item",
      "details": "2 Paket Ayam Bakar Jumbo",
      "time": "28 Des 11:36",
      "price": "Rp.58.800"
    },
    {
      "title": "Ayam Benjoss, kedungkandang",
      "items": "3 item",
      "details": "2 Paket Ayam Bakar Jumbo",
      "time": "28 Des 11:36",
      "price": "Rp.58.800"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            "Pesanan",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.green,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Riwayat"),
              Tab(text: "Dalam proses"),
              Tab(text: "Terjadwal"),
            ],
          ),
        ),
        body: TabBarView(
          children: [

            _buildOrderList(),

            Center(child: Text("Tidak ada pesanan dalam proses")),

            Center(child: Text("Tidak ada pesanan terjadwal")),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                value: "GoFood",
                items: ["GoFood", "GoSend", "GoMart"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              DropdownButton<String>(
                value: "Status",
                items: ["Status", "Selesai", "Batal"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
            ],
          ),
          SizedBox(height: 16),

          ...orders.map((order) {
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.restaurant, color: Colors.grey),
                  ),
                  SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order["title"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(order["items"]!),
                        Text(
                          order["details"]!,
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Makanan sudah diantar ${order["time"]!}",
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        order["price"]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                        ),
                        child: Text(
                          "Pesan lagi",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
