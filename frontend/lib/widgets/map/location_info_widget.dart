
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/map/transport_info_widget.dart';

import 'action_button.dart';
import 'map_widget.dart';

class LocationInfoWidget extends StatelessWidget {
  const LocationInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "청담동ABC",
            style: TextStyle(
              fontSize: 16,           // 16 : 기본 사이즈라서 기입할 필요는 없다.
              color: Colors.black54
            ),
          ),
          SizedBox(height: 16),
          Text(
            "서울특별시 강남구 청담동ABC",
            style: TextStyle(
                fontSize: 16,
                color: Colors.black54
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionButton(
                icon: Icons.directions,
                label: '길찾기',
                color: Colors.blue,
                onPressed: () { /* 길찾기 기능 구현 (버튼 클릭 시 네이버지도/카카오맵/T맵 등으로 이동하여 현위치 기준으로 길찾기 경로 확인하도록 한다. */ },
              ),
              SizedBox(height: 10),
              ActionButton(
                icon: Icons.copy,
                label: '주소 복사',
                color: Colors.grey[700]!,
                onPressed: () { /* 주소 복사 기능 구현 */ },
              )
            ],
          )
        ],
      ),
    );
  }
}