import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal/views/menu_page.dart';
import 'providers/cart_provider.dart';
import 'views/load_pages.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cesun Food Master',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const LoadPage(),
    );
  }
}
