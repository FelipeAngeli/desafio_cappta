class PrintDebugColoredUtils {
  static void printWhite(String message) {
    // ignore: avoid_print
    print('\x1B[37m$message\x1B[0m'); // Branco
  }

  static void printGreen(String message) {
    // ignore: avoid_print
    print('\x1B[32m$message\x1B[0m'); // Verde
  }

  static void printError(String message) {
    // ignore: avoid_print
    print('\x1B[31m$message\x1B[0m'); // Vermelho
  }
}
