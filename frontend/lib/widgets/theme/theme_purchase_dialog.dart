
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/theme_provider.dart';

class ThemePurchaseDialog extends StatelessWidget {
  final ThemeProvider themeProvider;
  final AppThemeType theme;

  const ThemePurchaseDialog({
    super.key,
    required this.themeProvider,
    required this.theme
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("테마 구매"),
      content: Text('${themeProvider.getThemeName(theme)}을(를) 구매하시겠습니까?'
      '\n 가격 : ${themeProvider.getThemePrice(theme)}원'),
      actions: [
        TextButton(onPressed: () =>
            // Navigator.pop(context),
            context.pop(),
            child: Text("취소")),
        FilledButton(onPressed: () async {
          // Navigator.pop(context);
          context.pop();
          showDialog(
              context: context,
              builder: (_) => Center(child: CircularProgressIndicator())
          );
          final success = await themeProvider.purchaseTheme(theme);
          if(context.mounted) {
            // Navigator.pop(context); // 로딩 닫기
            context.pop(); // 로딩 닫기
          }
          if(success) {
            themeProvider.changeTheme(theme);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("테마를 구매했습니다."),
                backgroundColor: Colors.lightGreenAccent,
              )
            );
          }
        }, child: Text("구매"))
      ]
    );
  }
}