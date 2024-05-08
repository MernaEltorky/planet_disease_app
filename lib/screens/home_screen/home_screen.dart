import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            TextFormField(
              decoration:const InputDecoration(
                border:OutlineInputBorder(),
                hintText: "Search Products ",
                prefixIcon: Icon(Icons.search),

              ),
            )
          ],
        ),
      ),
    );
  }
}