// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import '../home/deletePage.dart';
import '../home/updatePage.dart';
import '/crypt/encrypt.dart';
import '/model/userModel/userModel.dart';
import '/widgets/customTextField.dart';
import '/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  final Function visible, login;
  // ignore: use_key_in_widget_constructors
  const Login(this.visible, this.login);
  @override
  // ignore: library_private_types_in_public_api
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  String err = "";
  bool loading = false;
  void login(String email, String pass) async {
    setState(() {
      err = "";
      loading = true;
    });
    final response = await http.post(
        "https://mesprojetsapp.000webhostapp.com/article/login.php" as Uri,
        body: {"email": encrypt(email), "pass": encrypt(pass)});
    if (response.statusCode == 200) {
      var data = jsonDecode(decrypt(response.body));
      var result = data['data'];
      // ignore: avoid_print
      print(result);

      int succes = result[1];
      if (succes == 1) {
        setState(() {
          err = result[0];
          UserModel.saveUser(UserModel.fromJson(result[2]));
          loading = false;
          widget.login.call();
        });
      } else {
        setState(() {
          err = result[0];
          loading = false;
        });
      }
    }
  }

  CustomTextField emailText = CustomTextField(
    title: "Email",
    placeholder: "Enter email",
    initialValue: '',
  );
  CustomTextField passText = CustomTextField(
      title: "Password",
      placeholder: "***********",
      ispass: true,
      initialValue: '');
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "enter email";
    passText.err = "enter password";
    return loading
        ? const Loading()
        : Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          emailText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          passText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  login(emailText.value, passText.value);
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              color: Colors.redAccent.withOpacity(.7)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Avez-vous un compte? '),
                              FlatButton(
                                  onPressed: widget.visible(),
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(color: Colors.redAccent),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            err,
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    )),
              ),
            ),
          );
  }
}
