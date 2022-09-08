import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/components/icon_button.dart';
import 'package:notepad/contorllers/settings.dart';

class AddToDoBar extends StatelessWidget {
  const AddToDoBar({Key? key, required this.data}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySettings>(builder: (color) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(128, 0, 0, 0),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: color.secondaryBg,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      color: color.darkMode
                          ? const Color.fromARGB(255, 30, 29, 29)
                          : const Color.fromARGB(50, 0, 0, 0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 20),
                      margin: const EdgeInsets.only(
                        bottom: 10,
                        top: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 300,
                      child: TextField(
                        // controller: content,
                        autofocus: true,
                        onChanged: (value) => data.onContentChange(value),
                        decoration: const InputDecoration(
                          hintText: "Add Todo",
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    data.onEdit == true
                        ? MyIconButton(
                            onClick: () => data.addTodo(),
                            icon: MdiIcons.contentSaveCheckOutline,
                            bgColor: Colors.green,
                            color: Colors.white,
                          )
                        : Container(),
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
