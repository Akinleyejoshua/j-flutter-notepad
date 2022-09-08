import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onClick,
      required this.textColor,
      required this.bgColor})
      : super(key: key);

  final Color bgColor;
  final Function onClick;
  final String text;
  final Color textColor;
  // ignore: prefer_typing_uninitialized_variables
  final icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 100,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: InkWell(
          onTap: () => onClick(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      icon,
                      color: textColor,
                    )),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
