import 'package:package_info_plus/package_info_plus.dart';

import 'git_hash_provider.dart'
    if (dart.library.io) 'git_hash_provider_io.dart';

class AppVersionInfo {
  const AppVersionInfo({
    required this.version,
    required this.build,
    required this.gitHash,
  });

  /// Semantic version from pubspec.yaml (MAJOR.MINOR.PATCH).
  ///
  /// Developers should update this for bug fixes (patch), new features (minor),
  /// or breaking changes (major) when preparing beta/release builds.
  final String version;

  /// Build number from pubspec.yaml (the integer after the + sign).
  ///
  /// Increment this for every beta/release-worthy build so testers can uniquely
  /// identify what they are running.
  final String build;

  /// Optional short git commit hash for debugging builds outside app stores.
  final String? gitHash;

  String get displayVersion => 'Version $version (Build $build)';

  String get displayWithHash {
    final hash = gitHash;
    if (hash == null || hash.isEmpty) {
      return displayVersion;
    }
    return '$displayVersion • $hash';
  }

  static Future<AppVersionInfo> load() async {
    final info = await PackageInfo.fromPlatform();
    final gitHash = await GitHashProvider.getShortHash();
    return AppVersionInfo(
      version: info.version,
      build: info.buildNumber,
      gitHash: gitHash,
    );
  }
}
