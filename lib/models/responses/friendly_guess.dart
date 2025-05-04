class FriendlyGuess {
  final int loginId;
  final int guessPriorityOrder;
  final String username;
  final String guessString;

  FriendlyGuess({
    required this.loginId,
    required this.guessPriorityOrder,
    required this.username,
    required this.guessString,
  });

  factory FriendlyGuess.fromJson(Map<String, dynamic> json) {
    return FriendlyGuess(
      loginId: json['loginId'] as int,
      guessPriorityOrder: json['guessPriorityOrder'] as int,
      username: json['username'] as String,
      guessString: json['guessString'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loginId': loginId,
      'guessPriorityOrder': guessPriorityOrder,
      'username': username,
      'guessString': guessString,
    };
  }
}