import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:songguessgame/models/responses/token_response.dart';
import 'package:songguessgame/utils/storage_util.dart';

Future<TokenResponse> login(String username, String password) async {
  final url = Uri.parse('$configApiBaseUrl/Auth/Login');
  String? currentPushToken = await getPushNotificationToken();

  final headers = {'Content-Type': 'application/json'};

  final body = jsonEncode({
    'username': username,
    'password': password,
    'pushNotificationToken': currentPushToken
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return TokenResponse.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to login: ${response.reasonPhrase}');
  }
}

Future<TokenResponse> loginWithSocial(
    String provider, String idToken, String? friendlyName) async {
  String? currentPushToken = await getPushNotificationToken();

  final response = await http.post(
    Uri.parse('$configApiBaseUrl/Auth/LoginWithSocial'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'provider': provider,
      'idToken': idToken,
      'friendlyName': friendlyName,
      'pushNotificationToken': currentPushToken
    }),
  );

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return TokenResponse.fromJson(jsonResponse);
  } else {
    throw Exception('Social Login failed');
  }
}

Future<void> registerUser(
    {required String username,
    required String password,
    String? metadata}) async {
  final url = Uri.parse('$configApiBaseUrl/Auth/Register');

  final headers = {
    'Content-Type': 'application/json',
  };

  final body = {
    'username': username,
    'password': password,
    if (metadata != null) 'metadata': metadata,
  };

  final bodyJson = jsonEncode(body);

  final response = await http.post(url, headers: headers, body: bodyJson);

  if (configApiSuccessResponses.contains(response.statusCode)) {
    return;
  } else {
    throw Exception('Failed to register user: ${response.reasonPhrase}');
  }
}






