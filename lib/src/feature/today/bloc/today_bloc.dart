import 'package:color_mood_app/src/core/database/database.dart';
import 'package:color_mood_app/src/core/database/database_impl.dart';
import 'package:color_mood_app/src/core/extensions/date_time.dart';
import 'package:color_mood_app/src/core/models/mood/mood.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'today_event.dart';
part 'today_state.dart';

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  final IDatabase _database;

  TodayBloc({IDatabase? db})
      : _database = db ?? Database(),
        super(const TodayInitialState()) {
    on<TodayEvent>((event, emit) async {
      switch (event) {
        case TodayChooseMoodEvent():
          await _onChoose(event.mood, emit);
        case TodayLoadEvent():
          await _onLoad(emit);
      }
    });
  }

  Future<void> _onLoad(emit) async {
    final date = DateTime.now().getDay;
    final currentMood = await _database.getCurrentMood(date);
    emit(TodayIdleState(currentMood));
  }

  Future<void> _onChoose(MoodEntity mood, emit) async {
    await _database.insertMood(mood);
    emit(TodayIdleState(mood));
  }
}
