import 'package:chat/api/ServersApi.dart';
import 'package:chat/models/ConversationResponse.dart';
import 'package:chat/models/SigninRequest.dart';
import 'package:chat/models/SigninResponse.dart';
import 'package:chat/models/SignupRequest.dart';
import 'package:chat/models/User.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'ServersApiClient.g.dart';

@RestApi(baseUrl: ServersApi.BASE_URL)
abstract class ServersApiClient {
  factory ServersApiClient(Dio dio, {String baseUrl}) =
      _ServersApiClient;

  @POST("users")
  Future<User>? signup(@Body() SignupRequest request);

  @POST("authenticate")
  Future<SigninResponse>? signin(@Body() SigninRequest request);

  @GET("users/{userId}/conversations")
  Future<List<ConversationResponse>> getConversations(@Path("userId") String userId);

  @POST("users/{userId}/conversations")
  Future<ConversationResponse>? newConversation(@Path("userId") String userId, @Body() Map<String, String> request);
}
