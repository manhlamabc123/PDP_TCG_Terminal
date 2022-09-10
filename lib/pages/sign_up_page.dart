import 'package:flutter/material.dart';
import 'package:pdp_tcg/classes/my_auth.dart';
import 'package:pdp_tcg/pages/sign_in_page.dart';
import 'package:pdp_tcg/widgets/build_username.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

bool passInvalid = false;
bool passCFInvalid = false;

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordVisible = true;
  bool isPasswordConfirmVisible = true;
  String password = '';
  String passwordConfirm = '';
  final usernameController = TextEditingController();
  final passwordError = "Password must be more than 8 characters!";
  final passwordConfirmError = "Password does not match!";

  @override
  void initState() {
    super.initState();
    passInvalid = false;
    passCFInvalid = false;
    userInvalid = false;
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
                    'Create a new account',
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
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: buildPasswordConfirm(),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            //TO DO
                            setState(() {
                              debugPrint(
                                  'Username: ${usernameController.text}');
                              debugPrint('Password: $password');
                              debugPrint('Confirm Password: $passwordConfirm');
                              MyAuth.signUpUser(
                                usernameController.text,
                                password,
                                passwordConfirm,
                              );
                            });

                            if (!userInvalid &&
                                !passInvalid &&
                                !passCFInvalid) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SignInPage();
                                  },
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'SIGN UP',
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
              errorText: passInvalid ? passwordError : null,
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

  Widget buildPasswordConfirm() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Confirm Password',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 18),
          ),
          TextField(
            onChanged: (value) => setState(() {
              passwordConfirm = value;
            }),
            onSubmitted: (value) => setState(() {
              passwordConfirm = value;
            }),
            decoration: InputDecoration(
              hintText: 'Confirm your password...',
              errorText: passCFInvalid ? passwordConfirmError : null,
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
                    isPasswordConfirmVisible = !isPasswordConfirmVisible;
                  });
                },
                icon: isPasswordConfirmVisible
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
            obscureText: isPasswordConfirmVisible,
          ),
        ],
      );
}
