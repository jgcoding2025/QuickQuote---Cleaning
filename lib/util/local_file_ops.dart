// Local file helpers that are safe to import on all platforms.
//
// On web, there is no direct file system access like dart:io provides.
// These stubs keep the code compiling and let web builds run, while preserving
// the existing offline-first file behavior on mobile/desktop.

export 'local_file_ops_io.dart'
    if (dart.library.html) 'local_file_ops_web.dart';
