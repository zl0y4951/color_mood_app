part of 'today_bloc.dart';

sealed class TodayState {
  const TodayState({this.current});
  final MoodEntity? current;
}

class TodayInitialState extends TodayState {
  const TodayInitialState();
}

class TodayIdleState extends TodayState {
  const TodayIdleState({super.current});
}

class TodayErrorState extends TodayState {
  const TodayErrorState();
}
