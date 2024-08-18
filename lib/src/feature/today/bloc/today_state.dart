part of 'today_bloc.dart';

sealed class TodayState {
  const TodayState();
}

class TodayInitialState extends TodayState {
  const TodayInitialState();
}

class TodayIdleState extends TodayState {
  const TodayIdleState(this.current);
  final MoodEntity? current;
}

class TodayErrorState extends TodayState {
  const TodayErrorState();
}
