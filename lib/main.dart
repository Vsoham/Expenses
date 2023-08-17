import 'package:flutter/material.dart';
import './screens/category_screen.dart';
import 'package:provider/provider.dart';
import './models/database_provider.dart';
void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (_)=> DatabaseProvider(),
      child: const MyApp(),)
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CategoryScreen.name,
      routes: {
        CategoryScreen.name:(_) => const CategoryScreen(),
      },
    );
  }
}
