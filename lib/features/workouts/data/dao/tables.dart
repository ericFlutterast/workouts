import 'package:drift/drift.dart';
import 'package:workouts/common/utils/uuid.dart';

class Workout extends Table {
  TextColumn get workoutId => text().withDefault(Constant(UuidUtil.instance.v8()))();
  TextColumn get drillId => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get spentTime => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {workoutId};
}

class Drill extends Table {
  TextColumn get drillId => text().withDefault(Constant(UuidUtil.instance.v8()))();
  TextColumn get name => text()();
  IntColumn get set => integer()();
  IntColumn get repetitions => integer()();

  @override
  Set<Column<Object>> get primaryKey => {drillId};
}

class WorkoutDrill extends Table {
  IntColumn get workout => integer().references(Workout, #workoutId)();
  IntColumn get drill => integer().references(Drill, #drillId)();
}
