import 'package:chat/api/ServersApi.dart';
import 'package:chat/api/ServersApiClient.dart';
import 'package:chat/components/already_have_an_accout_acheck.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/SigninRequest.dart';
import 'package:chat/screens/Signup/signup_screen.dart';
import 'package:chat/screens/chats/chats_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late ServersApiClient _serversApiClient;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _serversApiClient = ServersApiClient(
        ServersApi.buildDio(base: ServersApi.BASE_URL),
        baseUrl: ServersApi.BASE_URL);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Icon(Icons.person),
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
          const SizedBox(height: kDefaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {
                try {
                  final res = await _serversApiClient.signin(
                    SigninRequest(
                        email: _emailController.text,
                        password: _passwordController.text),
                  );
                  print("Response signin: " + res.toString());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatsScreen(),
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
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
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
