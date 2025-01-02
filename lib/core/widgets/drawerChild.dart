import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiblah_app/core/appStyle/customTextStyle.dart';

class drawerChild extends StatelessWidget {
  const drawerChild({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap
  });
  final String text;
  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 5),
      
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 180.w,
        
          child: Row(
            children: [
              icon,
              SizedBox(width: 8.w),
              customText(
                myText: text,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
