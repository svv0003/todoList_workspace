import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/*
StatelessWidget
  변경되는 데이터가 위젯에 존재하지 않기 때문에 한 번에 UI와 데이터를 전체적으로 작성한다.

StatefulWidget
  변경되는 데이터가 위젯에 존재하기 때문에 클라이언트ㅏ 기다릴 수 있는 화면을 우선 띄우고,
  내부적으로 데이터를 교체하거나 주기적으로 변경할 수 있는 상태가 들어있는 UI를 참조하는 형태이다.

class 파일명 extends 클라이언트위젯화면 {
  고객님 저의가 사용할 변수와 기능이에요.
  우선적으로 화면에서 기다리는 고객들에게 사용하겠다는 변수와 기능명 선언한다.

  외부에서 이 파일 사용할 경우,
  선언한 변수나 기능에서 반드시 데이터를 전달하거나 전달받아야 하는 변수와 기능명 선언헌다.
  데이터 내부가 null이어도 되는 변수와 기능명을 구분지으며
  선언된 모든 변수와 기능은 생성자에서 필수인지 아닌지 작성히애 한다.
}
 */
class AddTodoDialog extends StatefulWidget {
  final Function(String) onAdd;
  const AddTodoDialog({
    super.key,
    required this.onAdd
  });

  /*
  화면 상태는 언제든 다시 생성될 수 있다.
  _AddTodoDialogState 내부적으로 데이터를 주고 받는 UI가 변경되면
  AddTodoDialog 선언한 변수나 기능을 _AddTodoDialogState 활용 가능하다.
   */
  @override
  State<AddTodoDialog> createState() => _AddTodoDialogState();
}



class _AddTodoDialogState extends State<AddTodoDialog>{

  /// 외부 파일에 상태를 전달하기 위한 원격 리모컨 컨트롤러 생성한다.
  final TextEditingController _controller = TextEditingController();
  void _handleAdd() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onAdd(text);
      // Navigator.pop(context);
      context.pop();
    }
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New Todo'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          hintText: 'What needs to be done?',
          border: OutlineInputBorder(),
        ),
        autofocus: true,
        maxLines: 3,
        onSubmitted: (_) => _handleAdd(),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              // Navigator.pop(context),
              context.pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _handleAdd,
          child: const Text('Add'),
        ),
      ],
    );
  }
}