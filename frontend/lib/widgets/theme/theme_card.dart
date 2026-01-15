
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/theme_provider.dart';

class ThemeCard extends StatelessWidget {
  final ThemeProvider themeProvider;
  final AppThemeType theme;
  final Color color;
  /*
  void : 반환없이 실행만
  callback : 가지고 온거 사용한다.
   */
  final VoidCallback onPurchaseRequested;

  const ThemeCard({
    super.key,
    required this.themeProvider,
    required this.theme,
    required this.color,
    required this.onPurchaseRequested
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = themeProvider.currentTheme == theme;
    final isPurchased = themeProvider.isThemePurchased(theme);

    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(12),
        side: BorderSide(
          color: isSelected ? color : Colors.transparent,
          width: 2
        )
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        // splashColor: Colors.blue.withOpacity(0.3),
        // highlightColor: Colors.grey.withOpacity(0.2),
        splashColor: Colors.blue.withValues(alpha: 0.3, red: 0.8, blue: 0.9, green: 0.3),
        highlightColor: Colors.grey.withValues(alpha: 0.2),
        onTap: isPurchased
        ? () => themeProvider.changeTheme(theme)
        : onPurchaseRequested,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      themeProvider.getThemeName(theme),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    )
                  ],
                )
              ),
              Icon(
                isSelected
                ? Icons.check_circle
                    : (isPurchased
                    ? Icons.circle_outlined
                    : Icons.lock_outline),
                color: isSelected ? color : Colors.grey[400],
                size: 28,
              )
            ],
          )
        ),
      ),
    );
  }
}

/*
onTap = 제스터 감지 위젯
        모든 위젯을 클릭 가능하게 할 수 있다. (<a></a>)
        개발자가 만든 커스텀 위젯을 클릭 가능하게 만들기 위해서 사용한다.
  - GestureDetector : 다양한 제스처 감지, 기본 효과 없다.
                      복잡한 제스처에 사용한다.
      - onTap: () => print("클릭 한 번")        // Button 형태의 위젯이 아니라 커스텀 위젯
      - onDoubleTap: () => print("클릭 두 번")
      - onLongPress: () => print("길게 누름")
      - onPanUpdate: () => print("드래그")
        └─────────────────────────────────────────────────────────── Button 태그에는 존재하지 않는다.
        GestureDetector(
            onDoubleTap: 버튼 글자를 두 번 클릭하면 이런 효과를 추가하겠다.
            onPanUpdate: 버튼 글자를 드래그하면 이런 효과를 추가하겠다.
            child: ElevatedButton(child: Text("버튼"))  # 버튼에서 드래그나 클릭 두 번과 같은 기능이 존재하지 않는다.
        )
        GestureDetector(
            onTap: 한 번 클릭 -> Button이 내부에 존재할 때 사용 지양한다.
            onDoubleTap: 버튼 글자를 두 번 클릭하면 이런 효과를 추가하겠다.
            onPanUpdate: 버튼 글자를 드래그하면 이런 효과를 추가하겠다.
            child: ElevatedButton(child: Text("버튼"), onPressed: 한 번 클릭)
        )
        -> 위처럼 onTap과 onPressed를 함께 사용한다면 충돌이 발생하고, 둘 다 무시되거나 onPressed가 우선적으로 동작한다.
        GestureDetector(
            onTap: 한 번 클릭
            onDoubleTap: 버튼 글자를 두 번 클릭하면 이런 효과를 추가하겠다.
            onPanUpdate: 버튼 글자를 드래그하면 이런 효과를 추가하겠다.
            child: Container(child: Text("버튼"))
        )


  - InkWell : 클릭 시 물결 효과, Material Design 스타일
              리스트나 카드 같은 UI에 사용한다.
              GestureDetector과 동일하게 작동하나 InkWell은 splash 효과를 함께 제공한다. (탭, 더블탭, 길게누르기, 드래그)

onPressed = 버튼 계열 위젯
            TextButton ElevatedButton IconButton 버튼 계열 위젯 사용한다.

 */