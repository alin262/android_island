import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isExpanded= false;
  void isToggled(){
    setState(() {
      isExpanded=!isExpanded;
      print(isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: 
          Stack(
            children: [
              const Center(child: Text("app content"),),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: GestureDetector(
                    onTap: isToggled,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),curve: Curves.easeInOutBack,
                      width:isExpanded? 120:300,height:isExpanded? 35:150,decoration: BoxDecoration(
                        color: Colors.black,borderRadius: BorderRadius.circular(isExpanded ? 30 : 20)
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        
    );
  }
}
