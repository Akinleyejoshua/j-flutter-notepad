import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton(
      {Key? key,
      required this.onClick,
      required this.icon,
      required this.bgColor,
      required this.color})
      : super(key: key);

  final Function onClick;
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => onClick(),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Icon(
              icon,
              color: color,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
