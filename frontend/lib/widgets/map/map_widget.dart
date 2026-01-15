
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<StatefulWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  /*
  final String viewId = "주소";   빨간줄 안 뜬다.
  final String viewId;            빨간줄 뜬다.
  Java와 다르게 Dart는 변수 선언만 하는 것을 저장공간 낭비라 판단하여 방지한다.
  추후 클라이언트가 작성한 데이터나 DB에서 가져온 데이터로 초기화하고자 할 땐
  반드시 생성자를 이용해서 변수에 값이 들어갈 수 있도록 하며, 생성자를 선언할 때
  필수로 데이터를 필요로 하는 변수인지, 선택적으로 변수에 값을 넣을 수 있는 변수인지 구분한다.

  final String viewId = "주소";             이 코드를
  final String viewId;                      이렇게 작성했다면
  const 클래스명 ({required this.viewId});   형식으로 생성자를 선언하여
  viewId 데이터가 필수인지 아닌지 구분할 개발자 의무가 있다.
   */

  // final String viewId = "google-maps-iframe";
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadHtmlString(_getMapHtml());
  }

  String _getMapHtml() {
    return '''
<!DOCTYPE html>
<html lang="en">
  <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <style>
      body {
        margin: 0;
        padding: 0;
      }
      iframe {
        width: 100%;
        height: 100vh;
        border: 0;
      }
      </style>
  </head>
  <body>
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7099.284583634034!2d126.98504452771108!3d37.569862068110524!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca37454f683b1%3A0xfa19c5217c6a0bc0!2z6rK967O16raBIOq0ke2ZlOusuA!5e0!3m2!1sko!2skr!4v1768445436847!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
  </body>
</html>
    ''';
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!)
        )
      ),
      child: WebViewWidget(controller: controller),
    );
  }


}