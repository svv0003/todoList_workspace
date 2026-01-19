import 'package:flutter/material.dart';
import 'package:frontend/widgets/todoList/add_todo_dialog.dart';
import 'package:frontend/widgets/todoList/statistics_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todoList/empty_state.dart';
import '../widgets/todoList/error_state.dart';
import '../widgets/todoList/todo_item.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    // 화면이 완전히 그려진 후 데이터 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoProvider>(context, listen: false).loadTodos();
    });
  }

  void _showAddDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AddTodoDialog(onAdd: (text){
        Provider.of<TodoProvider>(context, listen: false).addTodo(text);
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);          // 그라데이션
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todo List 2026'),
        actions: [
          IconButton(
            // onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const ThemeSettingScreen()
            //     )
            // );
            // },
            onPressed: () => context.go("/theme-settings"),
            // onPressed: () {
            //   // TODO: context.push()로 테마 설정 화면으로 이동
            // },
            // onPressed: () {
            //   // TODO: context.goNamed()로 테마 설정 화면으로 이동
            // },
            icon: const Icon(Icons.palette_outlined),
          ),
          IconButton(
            onPressed: () => context.go("/map"),
            icon: const Icon(Icons.map),
          ),
          IconButton(
            onPressed: () => context.go("/scaf"),
            icon: const Icon(Icons.folder),
          ),
          IconButton(
            onPressed: () => context.go("/game"),
            icon: const Icon(Icons.gamepad),
          ),
          IconButton(
            onPressed: () => context.go("/fonts"),
            icon: const Icon(Icons.font_download),
          ),
          IconButton(
            onPressed: () => context.go("/game2"),
            icon: const Icon(Icons.gamepad),
          ),
        ],
      ),
//       body: Consumer<TodoProvider>(
//         builder: (context, provider, child) {
//           if (provider.isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//
//           if (provider.errorMessage != null) {
//             return ErrorState(
//               message: provider.errorMessage!,
//               onRetry: () => provider.loadTodos(),
//             );
//           }
//
//           if (provider.todos.isEmpty) {
//             return const EmptyState(
//               icon: Icons.inbox_outlined,
//               mainText: 'No todos yet',
//               subText: 'Tap + to add a new todo',
//             );
//           }
//
//           // 정상적인 Todo 목록 표시
//           return Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     StatisticsBar(
//                         totalCount: provider.totalCount,
//                         activeCount: provider.activeCount,
//                         completedCount: provider.completedCount)
//                   ],
//                 ),
//               ),
//               const Divider(height: 1),
//               Expanded(
//                 child: RefreshIndicator(
//                   onRefresh: () => provider.loadTodos(),
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     itemCount: provider.todos.length,
//                     itemBuilder: (ctx, index) {
//                       return TodoItem(todo: provider.todos[index]);
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _showAddDialog(context),
//         child: const Icon(Icons.add),
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
          child: Consumer<TodoProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (provider.errorMessage != null) {
                return ErrorState(
                  message: provider.errorMessage!,
                  onRetry: () => provider.loadTodos(),
                );
              }

              if (provider.todos.isEmpty) {
                return const EmptyState(
                  icon: Icons.inbox_outlined,
                  mainText: 'No todos yet',
                  subText: 'Tap + to add a new todo',
                );
              }

              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    // 통계 바는 흰색 배경 유지하고 싶다면 그대로,
                    // 그라데이션 위에 얹고 싶다면 color: Colors.transparent로 변경 가능
                    // color: Colors.white.withOpacity(0.85), // 살짝 투명하게 조정 추천
                    color: themeProvider.gradientStart.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        StatisticsBar(
                          totalCount: provider.totalCount,
                          activeCount: provider.activeCount,
                          completedCount: provider.completedCount,
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Color(0xFaFFFFFFF),
                    thickness: 2,
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () => provider.loadTodos(),
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        itemCount: provider.todos.length,
                        itemBuilder: (ctx, index) {
                          return TodoItem(todo: provider.todos[index]);
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      // floatingActionButton은 그대로
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}