import 'package:flutter/material.dart';
import 'package:flutter_podstawy_utilities/widgets/margins.dart';
import 'package:task_timer/features/dashboard/page/widgets/entry/task_title_field.dart';
import 'package:task_timer/features/dashboard/page/widgets/new_task_actions.dart';

class NewTaskEntry extends StatefulWidget {
  const NewTaskEntry({super.key, required this.isVisible});

  final bool isVisible;

  @override
  State<NewTaskEntry> createState() => _NewTaskEntryState();
}

class _NewTaskEntryState extends State<NewTaskEntry> {
  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: TaskTitleField(textFieldController)),
          const HorizontalNormalMargin(),
          NewTaskActions(textFieldController),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }
}
