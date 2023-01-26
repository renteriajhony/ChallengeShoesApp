import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoes_model.dart';
import 'package:shoes_app/src/pages/shoes_page.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<ShoesModel>(create: (_) => ShoesModel()),
    ],
    child: const MyApp())
  );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      home: ShoesPage(),
    );
  }
}
