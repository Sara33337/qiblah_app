part of 'prayer_time_cubit.dart';

@immutable
sealed class PrayerTimeState {}

final class PrayerTimeInitial extends PrayerTimeState {}

final class PrayerTimeLoading extends PrayerTimeState {}

final class PrayerTimeLoaded extends PrayerTimeState {
  final Map<String, dynamic> prayerTimes;
  final String date;
  final String location;

  PrayerTimeLoaded(this.date, this.location, this.prayerTimes);
}

final class PrayerTimeError extends PrayerTimeState{
    final String error;
    PrayerTimeError(this.error);
}
