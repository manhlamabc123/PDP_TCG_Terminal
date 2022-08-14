import 'package:flutter/material.dart';
import 'package:pdp_tcg/classes/my_auth.dart';
import 'package:pdp_tcg/classes/user.dart';
import 'package:pdp_tcg/pages/home_page.dart';
import 'package:pdp_tcg/widgets/build_username.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

const passwordError1 = "Incorrect Password";
bool passwordInvalid1 = false;
bool passwordInvalid2 = true;
User? userCurrent;

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  String password = '';
  final usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordInvalid1 = false;
    passwordInvalid2 = false;
    userInvalid = false;
    userCurrent = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: buildUsername(usernameController),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: buildPassword(),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            //TO DO
                            debugPrint('Username: ${usernameController.text}');
                            debugPrint('Password: $password');
                            MyAuth.signInUser(
                              usernameController.text,
                              password,
                            ).then((value) {
                              setState(() {
                                userCurrent = value;
                              });
                              if (userCurrent != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const HomePage();
                                    },
                                  ),
                                );
                              }
                            });
                          },
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPassword() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Password',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 18),
          ),
          TextField(
            onChanged: (value) => setState(() {
              password = value;
            }),
            onSubmitted: (value) => setState(() {
              password = value;
            }),
            decoration: InputDecoration(
              hintText: 'Your password...',
              errorText: passwordInvalid1 ? passwordError1 : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black, width: 3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.blue, width: 3),
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: isPasswordVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
            obscureText: isPasswordVisible,
          )
        ],
      );
}
