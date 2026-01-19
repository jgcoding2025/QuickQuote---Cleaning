class GitHashProvider {
  static Future<String?> getShortHash() async {
    // Git metadata is not available on web builds or when the app is running
    // outside a git checkout, so return null in those environments.
    return null;
  }
}
