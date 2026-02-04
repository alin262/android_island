import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Center(child: Text("app content"),),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                width: 120,height: 35,decoration: BoxDecoration(
                  color: Colors.black,borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
