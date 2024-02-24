import 'package:flutter/material.dart';
import 'package:my_app/view_models/app_view_modal.dart';
import 'package:provider/provider.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModal>(builder: (context, viewModal, child) {
      return Container(
        decoration: BoxDecoration(
            color: viewModal.clrLvl2,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: ListView.separated(
          padding: EdgeInsets.all(15),
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 15,
            );
          },
          itemCount: viewModal.numTasks,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                viewModal.deleteTask(index);
              },
              background: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: viewModal.clrLvl1,
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      side: BorderSide(width: 2, color: viewModal.clrLvl3),
                      checkColor: viewModal.clrLvl1,
                      activeColor: viewModal.clrLvl3,
                      value: viewModal.getTaskValue(index),
                      onChanged: (value) {
                        viewModal.setTaskValue(index, value!);
                      }),
                  title: Text(
                    viewModal.getTaskTitle(index),
                    style: TextStyle(
                        color: viewModal.clrLvl4,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
