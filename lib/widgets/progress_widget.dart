import 'package:flutter/material.dart';
import 'package:swara/core/const.dart';

import 'custom_button.dart';

class CustomProgressWiget extends StatefulWidget {
  final double value;
  final String labelStart;
  final String labelEnd;

  CustomProgressWiget({
    this.value,
    this.labelStart,
    this.labelEnd,
  });

  @override
  _CustomProgressWigetState createState() => _CustomProgressWigetState();
}

class _CustomProgressWigetState extends State<CustomProgressWiget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: 50,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.labelStart,
                  style: TextStyle(
                      color: AppColors.styleColor),
                ),
                Text(
                  widget.labelEnd,
                  style: TextStyle(
                      color: AppColors.styleColor),
                )
              ],
            ),
          ),
          _mainPorgress(width),
          _progress_value(width * widget.value),
          _indicator_button(width * widget.value < 30 ? 30 : width * widget.value),
        ],
      ),
    );
  }

  Widget _indicator_button(width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 40,
        width: width,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            CustomButtonWidget(
              size: 30,
              child: Icon(
                Icons.fiber_manual_record,
                size: 20,
                color: AppColors.darkBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _progress_value(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 5,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          border: Border.all(
            color: AppColors.styleColor.withAlpha(90),
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(55),
          ),
        ),
      ),
    );
  }

  Widget _mainPorgress(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 5,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          border: Border.all(
            color: AppColors.styleColor.withAlpha(90),
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(55),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.styleColor.withAlpha(90),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(-1, -1))
          ],
        ),
      ),
    );
  }
}
