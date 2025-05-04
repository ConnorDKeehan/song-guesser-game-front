class NewGuessNotification {
  final int loginId;
  final String username;
  final bool guessingClosed;

  NewGuessNotification({
    required this.loginId,
    required this.username,
    required this.guessingClosed,
  });

  factory NewGuessNotification.fromJson(Map<String, dynamic> json) {
    return NewGuessNotification(
      loginId: json['loginId'] as int,
      username: json['username'] as String,
      guessingClosed: json['guessingClosed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loginId': loginId,
      'username': username,
      'guessingClosed': guessingClosed
    };
  }
}