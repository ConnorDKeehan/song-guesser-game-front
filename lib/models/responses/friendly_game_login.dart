class GameLogin {
  final int loginId;
  final int points;
  final int loginIndex;
  final bool gameMaster;
  final bool currentTurn;
  final String username;

  GameLogin({
    required this.loginId,
    required this.points,
    required this.loginIndex,
    required this.gameMaster,
    required this.currentTurn,
    required this.username
  });

  factory GameLogin.fromJson(Map<String, dynamic> json) {
    return GameLogin(
      loginId: json['loginId'] as int,
      points: json['points'] as int,
      loginIndex: json['loginIndex'] as int,
      gameMaster: json['gameMaster'] as bool,
      currentTurn: json['currentTurn'] as bool,
      username: json['friendlyName'] as String

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loginId': loginId,
      'points': points,
      'loginIndex': loginIndex,
      'gameMaster': gameMaster,
      'currentTurn': currentTurn,
      'friendlyName': username
    };
  }
}