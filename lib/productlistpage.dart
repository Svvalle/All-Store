import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text('Lista de produtos.',
          style: TextStyle(fontSize: 20, color: Colors.white, ),
        ),
      ),
    );
  }
}
