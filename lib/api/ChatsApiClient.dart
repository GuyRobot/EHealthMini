import 'package:chat/models/ChatResponse.dart';
import 'package:dio/dio.dart';
import 'package:chat/api/ChatsApi.dart';
import 'package:retrofit/http.dart';
part 'ChatsApiClient.g.dart';

@RestApi(baseUrl: ChatsApi.BASE_URL)
abstract class ChatsApiClient {
  factory ChatsApiClient(Dio dio, {String baseUrl}) =
      _ChatsApiClient;

  @POST("chat")
  Future<ChatResponse>? chat(@Body() ChatResponse request);
}
