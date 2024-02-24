import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/view_models/app_view_modal.dart';
import 'package:my_app/views/bottom_sheets/add_task_bottom_sheet_view.dart';
import 'package:provider/provider.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModal>(
      builder: (context, viewModal, child) {
        return SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: viewModal.clrLvl3,
                foregroundColor: viewModal.clrLvl1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              HapticFeedback.mediumImpact();
              viewModal.bottomSheetBuilder(
                  const AddTaskBottomSheetView(), context);
            },
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
