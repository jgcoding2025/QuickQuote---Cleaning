import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<String> savePdfToLocalFile({
  required String orgId,
  required String quoteId,
  required String docId,
  required Uint8List bytes,
}) async {
  final dir = await getApplicationDocumentsDirectory();
  final folder = Directory(p.join(dir.path, 'quickquote_pdfs', orgId, quoteId));
  if (!await folder.exists()) {
    await folder.create(recursive: true);
  }
  final file = File(p.join(folder.path, '$docId.pdf'));
  await file.writeAsBytes(bytes, flush: true);
  return file.path;
}
