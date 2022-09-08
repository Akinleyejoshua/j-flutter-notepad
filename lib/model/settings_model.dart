class Settings {
  final bool darkmode;

  Settings({
    required this.darkmode,
  });

  Settings.fromMap(Map<String, dynamic> item) : darkmode = item["darkmode"];

  Map<String, Object> toMap() {
    return {
      "darkmode": darkmode,
    };
  }
}
