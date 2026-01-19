//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// /*
// 어플이라고 해서 chrome 또는 edge에서 못 보는 것이 아니다.
// 방법은 있으나 반대로 app에서는 안 보인다.
//  */
// // dart:ui_web 기본 모듈을 줄여서 ui_web 변수로 사용하겠다.
// import 'dart:ui_web' as ui_web;
// import 'dart:html' as html;
//
// class HtmlMapWidget extends StatefulWidget {
//   const HtmlMapWidget({super.key});
//
//   @override
//   State<StatefulWidget> createState() => _HtmlMapWidgetState();
// }
//
// class _HtmlMapWidgetState extends State<HtmlMapWidget> {
//   final String viewId = 'google-maps-iframe';
//
//   @override
//   void initState() {
//     super.initState();
//     if (kIsWeb) {
//       _registerViewFactory();
//     }
//   }
//
//   void _registerViewFactory() {
//     ui_web.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
//       final iframe = html.IFrameElement()
//         ..src = 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7099.284583634034!2d126.98504452771108!3d37.569862068110524!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca37454f683b1%3A0xfa19c5217c6a0bc0!2z6rK967O16raBIOq0ke2ZlOusuA!5e0!3m2!1sko!2skr!4v1768445436847!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade'
//         ..style.border = "none"
//         ..style.width = '100%'
//         ..style.height = '100%'
//         ..allowFullscreen = true
//         ..setAttribute('loading', 'lazy')..setAttribute(
//             'referrerpolicy', 'no-referrer-when-downgrade');
//       return iframe;
//     });
//   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         border: Border(
// //           top: BorderSide(color: Colors.grey[300]!)
// //         )
// //       ),
// //       child: kIsWeb ? HtmlElementView(viewType: viewId)
// //           : Center(
// //         child: Text(
// //           "웹 브라우저에서만 지도를 볼 수 있다.",
// //           style: TextStyle(
// //             fontSize: 16,
// //             color: Colors.black54
// //           ),
// //         )
// //       )
// //     );
// //   }
// // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery
//         .of(context)
//         .size
//         .width;
//     final double mapWidth = screenWidth * 0.9;
//     final double mapHeight = mapWidth * 0.5;
//
//     return Center(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: Container(
//           width: mapWidth,
//           height: mapHeight,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey[300]!),
//           ),
//           child: kIsWeb
//               ? HtmlElementView(viewType: viewId)
//               : const Center(
//             child: Text(
//               "웹 브라우저에서만 지도를 볼 수 있다.",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }