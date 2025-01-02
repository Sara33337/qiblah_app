import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qiblah_app/core/appStyle/customTextStyle.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'dart:math';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahScreenState extends State<QiblahScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration:const Duration(microseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  bool hasPermission = false;

  Future getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        hasPermission = true;
      } else {
        Permission.location.request().then((value) {
          setState(() {
            hasPermission = (value == PermissionStatus.granted);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: customText(
            myText: "Qiblah direction",
            fontSize: 20,
            fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getPermission(),
          builder: (context, snapshot) {
            if (hasPermission) {
              return StreamBuilder(
                stream: FlutterQiblah.qiblahStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("No data available"),
                    );
                  }

                  final qiblahDirection = snapshot.data;
                  if (qiblahDirection == null) {
                    return Center(
                      child: Text("Failed to get Qiblah direction"),
                    );
                  }

                  animation = Tween(
                    begin: begin,
                    end: (qiblahDirection.qiblah * (pi / 180) * -1)).animate(_animationController!);
                  begin = (qiblahDirection.qiblah * (pi / 180) * -1);
                  _animationController!.forward(from: 0);

                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          "${qiblahDirection.direction.toInt()}°",
                          style: TextStyle(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        SizedBox(
                          height: 400,
                          child: AnimatedBuilder(
                            animation: animation!,
                            builder: (context, child) => Transform.rotate(
                              angle: animation!.value,
                              child: Image(
                                image: AssetImage(
                                  "assets/images/Group 4.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("Permission not granted"),
              );
            }
          }),
    );
  }
}
