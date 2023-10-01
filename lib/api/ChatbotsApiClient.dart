import 'package:chat/api/ChatbotsApi.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'ChatbotsApiClient.g.dart';

@RestApi(baseUrl: ChatbotsApi.BASE_URL)
abstract class ChatbotsApiClient {
  factory ChatbotsApiClient(Dio dio, {String baseUrl}) = _ChatbotsApiClient;

  @GET("conversations/{conversationId}/tracker")
  Future<String> getConversation(
      @Path("conversationId") String conversationId);
}
