import 'package:flutter/material.dart';
import 'package:my_app/view_models/app_view_modal.dart';
import 'package:provider/provider.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModal>(builder: (context, viewModal, child) {
      return Container(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Row(
          children: [
            //Total Tasks
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: viewModal.clrLvl2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            "${viewModal.numTasks}",
                            style: TextStyle(
                                fontSize: 20,
                                color: viewModal.clrLvl3,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            "Total Tasks",
                            style: TextStyle(
                                color: viewModal.clrLvl4,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            //Total Completed
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: viewModal.clrLvl2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            "${viewModal.numTasksRemaining}",
                            style: TextStyle(
                                fontSize: 20,
                                color: viewModal.clrLvl3,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            "Remaining",
                            style: TextStyle(
                                color: viewModal.clrLvl4,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
