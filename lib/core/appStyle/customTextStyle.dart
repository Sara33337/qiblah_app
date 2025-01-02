import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class customText extends StatelessWidget {
  const customText({
  super.key,
   required this.myText,
   required this.fontSize,
   required this.fontWeight});
  final String myText;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(fontSize: fontSize.sp,
        fontWeight: fontWeight),
      ),
    );
  }
}
