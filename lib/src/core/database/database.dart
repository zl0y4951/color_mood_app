import 'package:color_mood_app/src/core/models/mood/mood.dart';

abstract interface class IDatabase {
  Future<void> insertMood(MoodEntity mood);
  Future<MoodEntity?> getMood(int id);
  Future<List<MoodEntity>> getMoods();
  Future<void> updateMood(int id, MoodEntity newMood);
}
