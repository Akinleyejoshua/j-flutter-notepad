import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/contorllers/navbar_controller.dart';
import 'package:notepad/pages/search_note_page.dart';

class NoteHeader extends StatelessWidget {
  const NoteHeader({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    NavBarController navBarController = Get.put(NavBarController());

    return GetBuilder<NavBarController>(
      init: NavBarController(),
      builder: (_) => Container(
        padding: const EdgeInsets.only(top: 40, right: 0, left: 0, bottom: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              color: Colors.transparent,
              child: navBarController.toggleNavBar == true.obs
                  ? InkWell(
                      onTap: () {
                        navBarController.toggle(false.obs);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: const Icon(
                          MdiIcons.close,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        navBarController.toggle(true.obs);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: const Icon(
                          MdiIcons.menuOpen,
                          color: royalblue,
                        ),
                      ),
                    ),
            ),
            Text(
              title,
              style: const TextStyle(color: royalblue, fontSize: 20),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SearchNotePage()));
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Icon(
                    Icons.search_outlined,
                    color: royalblue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
