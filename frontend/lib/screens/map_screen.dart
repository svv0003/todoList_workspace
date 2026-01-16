/*
lib
├────── widgets/
│        ├────── location_info_widget.dart     # 장소 정보        -> 장소명, 주소, 버튼
│        ├────── action_button.dart            # 커스텀 액션 버튼
│        ├────── map_widget.dart               # 지도 view        -> Google Map Iframe WebView
│        ├────── transport_info_widget.dart    # 지도 webview     -> 대중교통 정보 컨테이너
│        └────── transport_info_item.dart      # 교통 정보 아이템
└────── screen/
         └────── map_screen.dart               # theme 설정 화면
         └────── invitation_map_page.dart      # theme 설정 화면
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/widgets/map/html_map_widget.dart';
import 'package:go_router/go_router.dart';

import '../widgets/map/location_info_widget.dart';
import '../widgets/map/transport_info_widget.dart';

class MapScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.go("/"),
            icon: Icon(Icons.arrow_back)
        ),
        title: const Text("오시는 길"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: const Column(
        children: [
          LocationInfoWidget(),
          // Expanded(child: MapWidget()),
          Expanded(child: HtmlMapWidget()),
          TransportInfoWidget()
        ],
      ),
    );
  }
}
