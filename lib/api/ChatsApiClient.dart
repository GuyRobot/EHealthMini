import 'package:chat/models/ChatbotRequest.dart';
import 'package:chat/models/ChatbotResponse.dart';
import 'package:dio/dio.dart';
import 'package:chat/api/ChatsApi.dart';
import 'package:retrofit/http.dart';
part 'ChatsApiClient.g.dart';

@RestApi(baseUrl: ChatsApi.BASE_URL)
abstract class ChatsApiClient {
  factory ChatsApiClient(Dio dio, {String baseUrl}) =
      _ChatsApiClient;

  @POST("webhooks/rest/webhook")
  Future<List<ChatbotResponse>>? chat(@Body() ChatbotRequest request);
}
