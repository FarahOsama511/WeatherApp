import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wheather/provider/providermodel.dart';
import 'package:wheather/ui/searchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Providermodel();
      },
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Searchpage()),
    );
  }
}
