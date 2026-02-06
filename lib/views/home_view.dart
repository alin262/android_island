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
                  double sensitivity = .1;
                  if (details.delta.dy > sensitivity) {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  }else if(details.delta.dy < -sensitivity){
                    setState(() {
                      isExpanded=!isExpanded;
                    });
                  }
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.all(1),
                  alignment: Alignment.center,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutBack,
                  width: isExpanded ? 300 : 127,
                  height: isExpanded ? 150 : 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(isExpanded ? 30 : 20),
                  ),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.face, color: Colors.white),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: isExpanded ? 1.0 : 0,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "calling...",
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
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 200),
                          opacity: isExpanded ? 1.0 : 0,
                          child: Icon(Icons.call_missed, color: Colors.red),
                        ),
                      ],
                    ),
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
