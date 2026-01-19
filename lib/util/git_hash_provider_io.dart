import 'dart:io';

class GitHashProvider {
  static Future<String?> getShortHash() async {
    try {
      final result = await Process.run('git', ['rev-parse', '--short', 'HEAD']);
      if (result.exitCode != 0) {
        return null;
      }
      final output = (result.stdout as String).trim();
      return output.isEmpty ? null : output;
    } catch (_) {
      return null;
    }
  }
}
