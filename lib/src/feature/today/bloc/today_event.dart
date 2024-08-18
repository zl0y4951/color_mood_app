part of 'today_bloc.dart';

sealed class TodayEvent {
  const TodayEvent();
}

class TodayChooseMood extends TodayEvent {
  const TodayChooseMood(this.mood);

  final MoodEntity mood;
}
