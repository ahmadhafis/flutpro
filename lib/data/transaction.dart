import 'package:drift/drift.dart';

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get transaction_date => dateTime()();
  IntColumn get nominal => integer()();
  TextColumn get name => text().withLength(max: 200)();
  IntColumn get list_id => integer()();
  TextColumn get description => text().withLength(max: 200)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
