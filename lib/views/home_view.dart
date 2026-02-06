import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isExpanded = true;
  void isToggled() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          const Center(child: Text("app content")),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: GestureDetector(
                onTap: isToggled,
                onVerticalDragUpdate: (details) {
                  int sensitivity = 3;
                  if (details.delta.dy > sensitivity) {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  } else if (details.delta.dy < -sensitivity) {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  }
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.all(1),
                  alignment: Alignment.center,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutBack,
                  width: isExpanded ? 300 : 150,
                  height: isExpanded ? 150 : 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(isExpanded ? 30 : 20),
                  ),
                  child: AnimatedCrossFade(
                    firstChild: const Center(
                      child: Text(
                        "Edison",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    secondChild: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.face, color: Colors.white),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Calling..",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Edison",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.missed_video_call, color: Colors.red),
                      ],
                    ),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 100),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
