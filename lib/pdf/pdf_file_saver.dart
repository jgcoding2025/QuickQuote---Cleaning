// Saves generated PDFs to a local file on IO platforms. On Web, there is no
// direct dart:io file access, so we return an empty path and let the UI handle
// viewing/sharing via other mechanisms.

export 'pdf_file_saver_io.dart'
    if (dart.library.html) 'pdf_file_saver_web.dart';
