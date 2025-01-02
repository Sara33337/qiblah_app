import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qiblah_app/core/appStyle/customTextStyle.dart';
import 'package:qiblah_app/core/widgets/drawerChild.dart';
import 'package:qiblah_app/features/home/logic/cubit/prayer_time_cubit.dart';
import 'package:qiblah_app/features/home/presentation/widgets/prayerTimes.dart';
import 'package:qiblah_app/features/qiblah/presentation/view/qiblahScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerTimeCubit()..fetchPrayerTimes(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
            builder: (context, state) {
              // Handle the loading state
              if (state is PrayerTimeLoading) {
                return AppBar(
                  title: customText(
                    myText: "Loading...",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                );
              } else if (state is PrayerTimeLoaded) {
                final location = state.location;
                return AppBar(
                  title: customText(
                    myText: location,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                );
              } else if (state is PrayerTimeError) {
                return AppBar(
                  title: customText(
                    myText: state.error,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                );
              }

              return AppBar(
                title: customText(
                  myText: "Qiblah Direction",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
        ),
        drawer: Drawer(
          width: 255.w,
          child: ListView(
            children: [
              SizedBox(
                height: 20.h,
              ),
              drawerChild(
                text: "Qiblah direction",
                onTap: () {
                  
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return QiblahScreen();
                  }));
                },
                icon: Icon(
                  Icons.mosque_outlined,
                  size: 20,
                ),
              ),
              drawerChild(
                  icon: Icon(
                    Icons.schedule_outlined,
                    size: 20,
                  ),
                  text: "Prayer schedule",
                  onTap: () {}),
              drawerChild(
                  icon: Icon(
                    Icons.settings_applications,
                    size: 20,
                  ),
                  text: "Setting",
                  onTap: () {})
            ],
          ),
        ),
        body: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
          builder: (context, state) {
            if (state is PrayerTimeLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PrayerTimeLoaded) {
              final timings = state.prayerTimes;
              final date = state.date;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: customText(
                        myText: date,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    width: 311.w,
                    height: 122.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFBBBBBB),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customText(
                          myText: "Dhuhur in",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        customText(
                          myText: "2 Hours 4 Minutes",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: timings.length,
                      itemBuilder: (context, index) {
                        final key = timings.keys.elementAt(index);
                        final value = timings[key];
                        return prayerTime(
                          prayerName: key,
                          prayerTimee: value,
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is PrayerTimeError) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
