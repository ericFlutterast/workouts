import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:workouts/common/utils/uuid.dart';
import 'package:workouts/features/workouts/data/dao/tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Workout, Drill])
final class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (migrator) => AppMigrationStrategy.onCreate(migrator),
        onUpgrade: (Migrator migrator, int from, int to) => AppMigrationStrategy.onUpdate(
          migrator,
          from,
          to,
        ),
      );

  static LazyDatabase _openConnection() => LazyDatabase(() async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(path.join(dbFolder.path, 'db.sqlite'));

        if (Platform.isAndroid) {
          await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
        }

        final cachebase = (await getTemporaryDirectory()).path;
        sqlite3.tempDirectory = cachebase;

        return NativeDatabase.createInBackground(file);
      });
}

final class AppMigrationStrategy {
  static Future<void> onCreate(Migrator migrator) async {
    await migrator.createAll();
  }

  static Future<void> onUpdate(Migrator migrator, int from, int to) async {}
}
