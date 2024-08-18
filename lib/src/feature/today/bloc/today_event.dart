part of 'today_bloc.dart';

sealed class TodayEvent {
  const TodayEvent();
}

class TodayLoadEvent extends TodayEvent {
  const TodayLoadEvent();
}

class TodayChooseMoodEvent extends TodayEvent {
  const TodayChooseMoodEvent(this.mood);

  final MoodEntity mood;
}
