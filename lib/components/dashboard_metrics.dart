import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/constants/colors.dart';
import 'package:notepad/contorllers/settings.dart';

class DashboardMetrics extends StatelessWidget {
  const DashboardMetrics(
      {required this.label, required this.amount, required this.icon, Key? key})
      : super(key: key);

  final String label;
  final String amount;
  // ignore: prefer_typing_uninitialized_variables
  final icon;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySettings>(
      builder: (color) => Expanded(
          child: Container(
        // width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.secondaryBg,
          border: Border.all(width: 0.5, color: color.white),
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 1),
              spreadRadius: 1,
              blurRadius: 10,
              color: Color.fromARGB(20, 0, 0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: color.whitesmoke,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      label,
                      style: const TextStyle(fontSize: 12, color: royalblue),
                    ),
                  ),
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 50,
                      color: color.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              icon,
              size: 40,
              color: royalblue,
            )
          ],
        ),
      )),
    );
  }
}
