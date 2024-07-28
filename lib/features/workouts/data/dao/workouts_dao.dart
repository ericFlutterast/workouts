import 'package:drift/drift.dart';
import 'package:workouts/common/database/app_database.dart';
import 'package:workouts/features/workouts/data/dao/tables.dart';

part 'workouts_dao.g.dart';

@DriftAccessor(tables: [Workout, Drill])
class WorkoutsDao extends DatabaseAccessor<AppDatabase> with _$WorkoutsDaoMixin {
  WorkoutsDao(super.appDatabase);
}
