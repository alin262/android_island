import 'package:flutter/material.dart';

enum IslandState { none, calling, music }

class DinamicIsland extends StatelessWidget {
  final bool isExpanded;
  final bool isShowIsland;
  final IslandState currentMode;
  final VoidCallback onTap;
  final Function(DragUpdateDetails) onDrag;

  const DinamicIsland({
    super.key,
    required this.isExpanded,
    required this.currentMode,
    required this.isShowIsland,
    required this.onTap,
    required this.onDrag,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: isShowIsland ? 50 : -150,
      left: 0,
      right: 0,
      duration: Duration(milliseconds: 500),
      curve: Curves.bounceOut,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: GestureDetector(
            onTap: onTap,
            onVerticalDragUpdate: onDrag,
            child: AnimatedContainer(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,

              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutBack,
              width: isExpanded
                  ? 300
                  : (currentMode == IslandState.music ? 220 : 150),
              height: isExpanded ? 150 : 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(isExpanded ? 30 : 25),
              ),
              child: OverflowBox(
                minWidth: 300,
                maxWidth: 300,
                minHeight: 150,
                maxHeight: 150,
                child: AnimatedCrossFade(
                  firstChild: currentMode == IslandState.music
                      ? const Center(
                          child: Text(
                            "Starboy",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const Center(
                          child: Text(
                            "Edison",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                  secondChild: currentMode == IslandState.music
                      ? Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.album,
                                  color: Colors.white,
                                ),
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Starboy",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "The Weeknd",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.pause_circle_filled,
                                color: Colors.white,
                                size: 40,
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.face, color: Colors.white),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                        ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
