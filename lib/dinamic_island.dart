import 'package:flutter/material.dart';

enum IslandState { none, calling, music, charging }

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
  double getWidth() {
    if (isExpanded) return 300;
    if (currentMode == IslandState.music) return 260;
    if (currentMode == IslandState.charging) return 220;
    return 150;
  }

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
              // alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,

              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutBack,
              width: getWidth(),
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
                  firstChild: _smallerView(),
                  secondChild: _biggerView(),
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

  Widget _smallerView() {
    if (currentMode == IslandState.music) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The Weeknd", style: TextStyle(color: Colors.white)),
            Icon(Icons.music_note, color: Colors.white),
            Text(
              "Starboy",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    if (currentMode == IslandState.charging) {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.battery_charging_full_rounded, color: Colors.white),
            Text(
              "Charging 75%",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    return Center(
      child: Text("shan", style: TextStyle(color: Colors.white)),
    );
  }

  Widget _biggerView() {
    if (currentMode == IslandState.music) {
      return Center(
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
              child: const Icon(Icons.album, color: Colors.white),
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
                  style: TextStyle(color: Colors.grey, fontSize: 12),
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
      );
    }
    if (currentMode == IslandState.charging) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.battery_charging_full,
              color: Colors.greenAccent,
              size: 50,
            ),
            SizedBox(height: 10),
            Text(
              "75% Charged",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
    return Center(
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
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                "Shan",
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
    );
  }
}
