import 'package:flutter/material.dart';
import 'package:my_chat/shared/components/button.dart';
import 'package:my_chat/shared/components/input_password.dart';
import 'package:my_chat/shared/components/input_text.dart';
import 'package:my_chat/shared/extensions/email_validator.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userNameKey = TextEditingController();
  final TextEditingController _firstNameKey = TextEditingController();
  final TextEditingController _lastNameKey = TextEditingController();
  final TextEditingController _emailKey = TextEditingController();
  final TextEditingController _passwordKey = TextEditingController();
  final TextEditingController _confirmPasswordKey = TextEditingController();

  submit() {
    print(_userNameKey.text);
    print(_firstNameKey.text);
    print(_lastNameKey.text);
    print(_emailKey.text);
    print(_passwordKey.text);
    print(_confirmPasswordKey.text);
  }

  @override
  Widget build(BuildContext context) {
    toLoginPage() {
      Navigator.pushNamed(context, "/login");
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
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    shrinkWrap: true,
                    children: [
                      const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
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
                      InputText(
                        controller: _firstNameKey,
                        label: "First name",
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Inform the first name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputText(
                        controller: _lastNameKey,
                        label: "Last name",
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Inform the last name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputText(
                        controller: _emailKey,
                        label: "Email",
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Inform the email";
                          }
                          if (!value.isValidEmail()) {
                            return "Inform an valid email";
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
                          if(value != _confirmPasswordKey.text){
                            return "The passwords don't match";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      InputPassword(
                        controller: _confirmPasswordKey,
                        label: "Confirm password",
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Inform the confirm password";
                          }
                          if(value != _passwordKey.text){
                            return "The passwords don't match";
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
                        submit();
                      }
                    },
                    label: "Register",
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
                          "But if you already have account",
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
                    onClick: toLoginPage,
                    label: "Login",
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
