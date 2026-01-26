import 'package:flutter/material.dart';

class GroundWidget extends StatelessWidget {
  const GroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child : Container(
        // color: Colors.brown,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ground.jpg'),
                fit: BoxFit.cover,     // 화면 전체 덮는다.
                // fit: BoxFit.fill,      // 비율 무시하고 전체 차지한다.
                // fit: BoxFit.contain,   // 비율 유지한 체 전체 보인다.
                filterQuality: FilterQuality.none,
                alignment: Alignment.topCenter,
              )
          )
      )
    );
  }
}
