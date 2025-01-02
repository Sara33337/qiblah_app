import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiblah_app/core/appStyle/customTextStyle.dart';


class prayerTime extends StatefulWidget {
  prayerTime({super.key, required this.prayerName, required this.prayerTimee});
  final String prayerName;
  final String prayerTimee;

  @override
  State<prayerTime> createState() => _prayerTimeState();
}

class _prayerTimeState extends State<prayerTime> {
  bool isSelected = false;
  Color unSelected = Color(0xFFE5E5E5);
  Color selected = Color(0xFFBBBBBB);

  @override
  Widget build(BuildContext context) {
    
  

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          unSelected = isSelected ? selected : Color(0xFFE5E5E5);
        });
    
      },
      child: Container(
        width: 311.w,
        height: 52.h,
        margin: EdgeInsets.only(left: 27, right: 27, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: unSelected,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(
                myText: widget.prayerName,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              customText(
                myText: widget.prayerTimee,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
