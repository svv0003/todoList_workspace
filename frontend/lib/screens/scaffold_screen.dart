import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldScreen extends StatelessWidget {
  const ScaffoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: () => context.go("/"), icon: Icon(Icons.arrow_back)),
        title: const Text("상단 바"),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Body 위치'),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('현위치 Scaffold에서 보여줄 메신저입니다.')
                  )
                );
              },
              child: const Text('화면 구경하기')
            )
          ],
        )
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Icon(Icons.door_front_door),
                  SizedBox(height: 20),
                  Text('홍길동님'),
                  Text('로그아웃')
                ]
              ),
            ),
            ListTile(
              leading: Icon(Icons.bedroom_parent),
              title: Text("목록 2번"),
              onTap: () {Navigator.pop(context);},
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("제가 보이십니까?!"),
              duration: Duration(seconds: 2),
            )
          );
        },
        child: Icon(Icons.balcony),),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.storage), 
            label: '창고'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.build), 
            label: '설정'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.wine_bar), 
            label: '구독'
        ),
      ]),
    );
  }
}
