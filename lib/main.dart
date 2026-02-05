import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/home_view.dart';

void main(){runApp(const MyApp());
WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Android Island",
      home: HomeView(),
      
    );
  }
}