import 'package:color_mood_app/src/core/models/mood/mood.dart';

part 'today_event.dart';
part 'today_state.dart';

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  TodayBloc() : super(TodayInitial()) {
    on<TodayEvent>((event, emit) {});
  }
}
