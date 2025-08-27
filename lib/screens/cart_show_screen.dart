import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_api_shared_sqflite/providers/auth_provider.dart';

import '../providers/carts_api_provider.dart';

class CartShowScreen extends StatefulWidget {
  const CartShowScreen({super.key});

  @override
  State<CartShowScreen> createState() => _CartShowScreenState();
}

class _CartShowScreenState extends State<CartShowScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartsApiProvider>(context, listen: false).getDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var userName = Provider.of<AuthProvider>(context);
    var cartProvider = Provider.of<CartsApiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome : ${userName.name}"),
        actions: [
          TextButton(
            onPressed: () {
              userName.logOutUserAuthProvider(context);
            },
            child: const Text("LogOut"),
          ),
        ],
      ),
      body:
          cartProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : cartProvider.cartsData.isEmpty
              ? Center(child: Text("Data is not found"))
              : ListView.builder(
                itemCount: cartProvider.cartsData.length,
                itemBuilder: (context, index) {
                  var cart = cartProvider.cartsData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User ID:${cart.userId}"),
                            const SizedBox(height: 5),
                            Text("Date:${cart.date}"),
                            const SizedBox(height: 10),
                            const Text(
                              "Products:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),

                            SizedBox(
                              height: 60,
                              child: ListView.builder(
                                itemCount: cart.products?.length ?? 0,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, pIndex) {
                                  var product = cart.products![pIndex];
                                  return Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade100,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("PID: ${product.productId}"),
                                        Text("Qty: ${product.quantity}"),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
