import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/theme/theme_list.dart';

/*
lib
├────── widgets/
│        ├────── theme_card.dart               # theme 카드 메인
│        ├────── theme_list.dart               # theme 목록
│        └────── theme_purchase_dialog.dart    # theme 구매 다이얼로그
└────── screens/
         └────── theme_setting_screen.dart     # theme 설정 화면
 */

class ThemeSettingScreen extends StatelessWidget {
  const ThemeSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);    // 그라데이션

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () => context.go("/"), icon: Icon(Icons.arrow_back)),
        title: const Text("테마 설정"),
      ),
//       body: Consumer<ThemeProvider>(
//         builder: (context, themeProvider, child) {
//           return ThemeList(themeProvider: themeProvider);
//         }
//       ),
//     );
//   }
// }

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              themeProvider.gradientStart,
              themeProvider.gradientEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: ThemeList(themeProvider: themeProvider),
        ),
      ),
    );
  }
}