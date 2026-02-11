import 'package:android_island/dinamic_island.dart';
import 'package:flutter/material.dart';

// enum IslandState { none, calling, music }

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isExpanded = false;
  bool isShowIsland = false;
  IslandState currentMode = IslandState.none;

  void toggleSize() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void handleDrag(DragUpdateDetails details) {
    int sensitivity = 3;

    if (details.delta.dy > sensitivity) {
      setState(() => isExpanded = true);
    } else if (details.delta.dy < -sensitivity) {
      setState(() => isExpanded = false);
    }
  }

  void  showNotification(IslandState mode) async {
    setState(() {
      currentMode = mode;
      isExpanded = false;
      isShowIsland = true;
      if (currentMode == IslandState.none) {
        isShowIsland = false;
      }
    });

    if(currentMode==IslandState.charging){
      await Future.delayed(const Duration(seconds: 2));
      if(mounted && currentMode ==IslandState.charging){
        setState(() {
          isShowIsland=false;
          isExpanded=false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 ElevatedButton(
                      onPressed: () {
                        showNotification(IslandState.charging);
                      },
                      child: Text("Charging"),
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showNotification(IslandState.music);
                      },
                      child: Text("music moder"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showNotification(IslandState.calling);
                      },
                      child: Text("normal mode"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showNotification(IslandState.none);
                      },
                      child: Text("up"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          DinamicIsland(
            isExpanded: isExpanded,
            currentMode: currentMode,
            isShowIsland: isShowIsland,
            onTap: toggleSize,
            onDrag: handleDrag,
          ),
        ],
      ),
    );
  }
}
