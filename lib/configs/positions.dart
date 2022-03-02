class Positions {
  static const String gk = "Goalkeeper";
  static const String def = "Defender";
  static const String mid = "Midfielder";
  static const String fwd = "Forward";

  static int compareTo(String p0, String p1) {
    if (p0 == p1) return 0;
    if (p0 == Positions.gk) return -1;
    if (p1 == Positions.gk) return 1;
    if (p0 == Positions.def) return -1;
    if (p1 == Positions.def) return 1;
    if (p0 == Positions.mid) return -1;
    if (p1 == Positions.mid) return 1;
    if (p0 == Positions.fwd) return -1;
    if (p1 == Positions.fwd) return 1;
    return 0;
  }
}
