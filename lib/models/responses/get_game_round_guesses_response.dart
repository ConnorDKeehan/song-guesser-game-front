import 'package:songguessgame/models/entities/guess.dart';
import 'package:songguessgame/models/entities/song.dart';
import 'package:songguessgame/models/responses/friendly_guess.dart';

class GetGameRoundGuessesResponse {
  final List<FriendlyGuess> guesses;
  final Song song;

  GetGameRoundGuessesResponse({
    required this.guesses,
    required this.song
  });

  factory GetGameRoundGuessesResponse.fromJson(Map<String, dynamic> json) {
    return GetGameRoundGuessesResponse(
      guesses: (json['guesses'] as List<dynamic>)
          .map((e) => FriendlyGuess.fromJson(e as Map<String, dynamic>))
          .toList(),
      song: Song.fromJson(json['song'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'guesses': guesses.map((e) => e.toJson()).toList(),
      'song': song.toJson()
    };
  }
}