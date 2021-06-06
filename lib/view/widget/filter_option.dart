import 'package:flutter/material.dart';
import 'package:zeb_pay_assignment/utils/app_color.dart';

class FilterButton extends StatelessWidget {
  final Function onTap;
  final bool isAscending;

  FilterButton({@required this.onTap, this.isAscending = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 28,
        padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
        width: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: primaryblue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isAscending) ...{
              const Icon(Icons.fiber_manual_record, color: Colors.white),
              Text(
                'A-Z',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 4),
            } else ...{
              SizedBox(width: 4),
              Text(
                'Z-A',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const Icon(Icons.fiber_manual_record, color: Colors.white),
            },
          ],
        ),
      ),
    );
  }
}
