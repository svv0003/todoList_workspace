import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class FontScreen extends StatelessWidget {
  const FontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () => context.go("/"), icon: Icon(Icons.arrow_back)),
        title: Text(
          'Google Font 모음',
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.bold
          )
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'hello',
              style: GoogleFonts.roboto(
                fontSize: 32,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 20),
            Text(
              'hello',
              style: GoogleFonts.specialGothicExpandedOne(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Rubik English Font',
              style: GoogleFonts.rubikStorm(
                fontSize: 32,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Honk English Font',
              style: GoogleFonts.honk(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Honk English Font',
              style: GoogleFonts.honk(
                fontSize: 32,
                fontWeight: FontWeight.w400,
                color: Colors.pink
              ),
            ),
            SizedBox(height: 20),
            /*
            글자 내부 그라디언트 적용 색상의 경우
            Theme로 그라디언트 설정하여 커스텀 클래스나 컬러 디자인을 따로 만든 후 호출하지 않는 한
            직접적으로 사용하는 것을 지양한다.
            web에서는 그라디언트가 적용되는 것처럼 보이지만 어플에서는 적용되지 않는다.

            만약 정말로 사용하고자 한다면
            simple_gradient_text 또는 gradient_borders와 유사한 모듈들이 존재한다.
            이 모듈을 사용해서 텍스트 글자 내부에 그라디언트를 줄 수 있다.

            이러한 이유는 그라디언트가 글자 color가 아닌 이미지 color 설정해야 하기 때문이다.
            따라서 아무리 color 설정해도 적용되지 않는다.
             */
            /*
            그라디언트의 경우
            모듈을 사용하여 적용하기
            ShaderMask 기본 모델은 버그가 많다.
             */
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  Color(0xFFFF6984),
                  Color(0xFFFF1493),
                  Color(0xFFC71585),
                ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ).createShader(bounds),
            child: Text(
                'Honk English Font',
                style: GoogleFonts.honk(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.pink,
                  // shadows: [
                  //   Shadow(
                  //     color: Colors.black.withOpacity(0.5),
                  //     offset: Offset(3, 3),
                  //     blurRadius: 8
                  //   )
                  // ]
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.font_download),
            label: '폰트'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '설정'
        ),
      ],
      currentIndex: 1,
      onTap: (index){}),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                // content: Text(
                //   "버튼을 눌렀습니다!",
                //   style: GoogleFonts.notoSans(
                //     fontSize: 20,
                //     fontWeight: FontWeight.w300
                //   ),
                // ),
                content: Text(
                  "버튼을 눌렀습니다!",
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    fontSize: 24
                  ),
                ),
                duration: const Duration(seconds: 2),
              )
          );
        },
        child: Icon(Icons.balcony),),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                '메뉴',
                style: GoogleFonts.notoSans(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                '홈',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                context.go('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.font_download),
              title: Text(
                '폰트',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                context.pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                '설정',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // TODO: 설정 화면으로 이동
                Navigator.pop(context);
              },
            ),

            // 필요 시 구분선 추가
            const Divider(),

            // 로그아웃 등 추가 항목 예시
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('로그아웃'),
              onTap: () {
                // TODO: 로그아웃 로직
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )
    );
  }
}