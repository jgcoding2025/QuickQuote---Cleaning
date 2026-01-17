import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

/// Opens the Drift database connection for IO platforms (Android/iOS/desktop).
///
/// This preserves the existing offline-first SQLite file behavior used by the
/// mobile app.
LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/quickquote.sqlite');
    return NativeDatabase(file);
  });
}
