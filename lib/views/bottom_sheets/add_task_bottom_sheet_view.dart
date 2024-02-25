import 'package:flutter/material.dart';
import 'package:my_app/models/task_modal.dart';
import 'package:my_app/view_models/app_view_modal.dart';
import 'package:provider/provider.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();

    return Consumer<AppViewModal>(builder: ((context, viewModal, child) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 100,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text("Add Task", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: viewModal.clrLvl3),)),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 250,
                  child: TextField(
                    onSubmitted: (value) {
                      if (entryController.text.isNotEmpty) {
                        Task newTask = Task(title: entryController.text, complete: false);
                        viewModal.addTask(newTask);
                        entryController.clear();
                      }
                      Navigator.of(context).pop();
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      filled: true,
                      fillColor: viewModal.clrLvl2,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(width: 0, style: BorderStyle.none)),
                    ),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: viewModal.clrLvl4,
                    autofocus: true,
                    autocorrect: false,
                    controller: entryController,
                    style: TextStyle(
                        color: viewModal.clrLvl4, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
