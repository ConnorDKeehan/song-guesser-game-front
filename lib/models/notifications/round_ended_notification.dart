class RoundEndedNotification {
  final int gameRoundId;

  RoundEndedNotification({
    required this.gameRoundId
  });

  factory RoundEndedNotification.fromJson(Map<String, dynamic> json) {
    return RoundEndedNotification(
      gameRoundId: json['gameRoundId'] as int
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gameRoundId': gameRoundId
    };
  }
}