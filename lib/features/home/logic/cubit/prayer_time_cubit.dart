import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qiblah_app/features/home/logic/services/getPrayerTime.dart';
part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeInitial());

  void fetchPrayerTimes() {
    final PrayerTimesService getTimes = PrayerTimesService();
    emit(PrayerTimeLoading());

    getTimes.getPrayerTimes().then((response) {
      final prayerTimes = response['timings'];
      final date = response['date'];
      final location = response['location'];
      emit(PrayerTimeLoaded(date, location, prayerTimes));
    }).catchError((error) {
      emit(PrayerTimeError(error.toString()));
    });
  }
}
