import 'package:flutter/material.dart';
import 'package:kos_app/pages/splash_page.dart';
import 'package:kos_app/provider/space_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SpaceProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SpashPage(),
        ));
  }
}
