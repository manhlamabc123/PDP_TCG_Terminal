import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isPasswordVisible = false;
  bool isPasswordConfirmVisible = false;
  String password = '';
  final usernameController = TextEditingController();

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
                    child: buildUsername(),
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
                            debugPrint('Username: ${usernameController.text}');
                            debugPrint('Password: $password');
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

  Widget buildUsername() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Username',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 18),
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              hintText: 'Your username...',
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
            ),
          ),
        ],
      );

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
            decoration: InputDecoration(
              hintText: 'Confirm your password...',
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
            obscureText: isPasswordVisible,
          ),
        ],
      );
}
