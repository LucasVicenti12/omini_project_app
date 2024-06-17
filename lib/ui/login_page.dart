import 'package:flutter/material.dart';
import 'package:my_chat/shared/components/button.dart';
import 'package:my_chat/shared/components/input_password.dart';
import 'package:my_chat/shared/components/input_text.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameKey = TextEditingController();
  final TextEditingController _passwordKey = TextEditingController();

  submit(String userName, String password) {
    print(userName);
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    toRegisterPage() {
      Navigator.pushNamed(context, "/register");
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      InputText(
                        controller: _userNameKey,
                        label: "Username",
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Inform the username";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputPassword(
                        controller: _passwordKey,
                        label: "Password",
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Inform the password";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Button(
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        submit(
                            _userNameKey.value.text, _passwordKey.value.text);
                      }
                    },
                    label: "Login",
                    type: ButtonType.action,
                    fullWidth: true,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or if you don't have account",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Button(
                    onClick: toRegisterPage,
                    label: "Create an account",
                    type: ButtonType.normal,
                    fullWidth: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
