import 'package:flutter/material.dart';
import 'package:frontend/widgets/login/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0.7),
          ]),
        ),
        child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginHeader(),
                      SizedBox(height: 30),
                    ],
                  ),
              ),
            ),
        ),
      ),
    );
  }
}

/*
if (provider.todos.isEmpty) {
  return const EmptyState(
    icon: Icons.inbox_outlined,
    mainText: 'No todos yet',
    subText: 'Tap + to add a new todo',
  );
}

 */