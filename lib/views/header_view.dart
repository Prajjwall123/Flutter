import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/view_models/app_view_modal.dart';
import 'package:my_app/views/bottom_sheets/delete_bottom_sheet_view.dart';
import 'package:my_app/views/bottom_sheets/settings_bottom_sheet_view.dart';
import 'package:provider/provider.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModal>(builder: (context, viewModal, child) {
      return Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              "Welcome Back,",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w400,
                                  color: viewModal.clrLvl4),
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              viewModal.username,
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: viewModal.clrLvl4),
                            )),
                      ),
                    )
                  ],
                ),
              )),
          //Trash Icon
          Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () {
                    viewModal.bottomSheetBuilder(
                        DeleteBottomSheetView(), context);
                  },
                  child: Icon(
                    Icons.delete,
                    color: viewModal.clrLvl3,
                    size: 40,
                  ))),
          //Setting Icon
          Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () {
                    viewModal.bottomSheetBuilder(
                        SettingsBottomSheetView(), context);
                  },
                  child: Icon(
                    Icons.settings,
                    color: viewModal.clrLvl3,
                    size: 40,
                  )))
        ],
      );
    });
  }
}
