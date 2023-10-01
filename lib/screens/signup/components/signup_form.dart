import 'package:chat/api/ServersApi.dart';
import 'package:chat/api/ServersApiClient.dart';
import 'package:chat/components/already_have_an_accout_acheck.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/SignupRequest.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:chat/screens/signin/signin_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late ServersApiClient _serversApiClient;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _serversApiClient = ServersApiClient(
        ServersApi.buildDio(base: ServersApi.BASE_URL),
        baseUrl: ServersApi.BASE_URL);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _usernameController,
            textInputAction: TextInputAction.done,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: "Username",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kDefaultPadding),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Icon(Icons.mail),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          ElevatedButton(
            onPressed: () async {
              try {
                final res = await _serversApiClient.signup(
                  SignupRequest(
                      username: _usernameController.text,
                      email: _emailController.text,
                      password: _passwordController.text),
                );
                print("Response signup: " + res.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatsScreen(token: res!.id, user: res),
                  ),
                );
              } catch (e) {
                switch (e.runtimeType) {
                  case DioError:
                    // Here's the sample to get the failed response error code and message
                    final res = (e as DioError).response;
                    print(
                        "Got error : ${res!.statusCode} -> ${res.statusMessage}");
                    break;
                  default:
                    break;
                }
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: kDefaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SigninScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
