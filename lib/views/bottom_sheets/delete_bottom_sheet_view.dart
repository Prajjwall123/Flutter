import 'package:flutter/material.dart';
import 'package:my_app/view_models/app_view_modal.dart';
import 'package:provider/provider.dart';

class DeleteBottomSheetView extends StatelessWidget {
  const DeleteBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModal>(builder: ((context, viewModal, child) {
      return SizedBox(
        height: 125,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 55,
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    viewModal.deleteAllTask();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: viewModal.clrLvl1,
                      backgroundColor: viewModal.clrLvl3,
                      textStyle:
                          const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.delete),
                      Text("All"),
                    ],
                  )),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              height: 55,
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    viewModal.deleteCompletedTask();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: viewModal.clrLvl1,
                      backgroundColor: viewModal.clrLvl3,
                      textStyle:
                          const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.delete),
                      Text("Completed"),
                    ],
                  )),
            ),
          ],
        ),
      );
    }));
  }
}
