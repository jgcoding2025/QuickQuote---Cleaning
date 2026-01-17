// Drift database connection factory that works on both IO (mobile/desktop)
// and Web (browser).
//
// - On mobile/desktop we keep the existing SQLite file-backed database so the
//   offline-first behavior stays exactly the same.
// - On Web we use IndexedDB via drift's WebDatabase.

export 'open_connection_io.dart'
    if (dart.library.html) 'open_connection_web.dart';
