import 'package:flutter/material.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(
                "assets/images/go_logo.png",
              ),
              height: 50,
            ),
            Text(
              "Market",
            ),
          ],
        ),
      ),
      body: Placeholder(),
    );
  }
}
