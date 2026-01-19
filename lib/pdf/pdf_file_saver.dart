// Saves generated PDFs to a local file on IO platforms. On Web, the bytes are
// stored in shared preferences and we return a lookup key.

export 'pdf_file_saver_io.dart'
    if (dart.library.html) 'pdf_file_saver_web.dart';
