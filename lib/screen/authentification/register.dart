// ignore_for_file: avoid_print

import 'dart:convert';

import '../home/deletePage.dart';
import '../home/updatePage.dart';
import '/widgets/customTextField.dart';
import '/widgets/loading.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  final Function visible;
  const Register(this.visible, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  String err = "";
  bool loading = false;
  CustomTextField emailText = CustomTextField(
    title: "Email",
    placeholder: "Enter email",
    initialValue: '',
  );
  CustomTextField nameText = CustomTextField(
    title: "Name",
    placeholder: "Enter name",
    initialValue: '',
  );
  void register(String name, String email, String pass) async {
    setState(() {
      loading = true;
    });
    final response = await http.post(
        "https://mesprojetsapp.000webhostapp.com/article/register.php" as Uri,
        body: {"name": name, "email": email, "pass": pass});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['data'];
      int succes = result[1];
      if (succes == 1) {
        setState(() {
          err = result[0];
          loading = false;
        });
      } else {
        setState(() {
          err = result[0];
          loading = false;
        });
      }
    }
  }

  CustomTextField passText = CustomTextField(
      title: "Password",
      placeholder: "***********",
      ispass: true,
      initialValue: '');
  CustomTextField confirmPassText = CustomTextField(
      title: "Confirm Password",
      placeholder: "***********",
      ispass: true,
      initialValue: '');
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "enter email";
    nameText.err = "enter name";
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
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          nameText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          emailText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          passText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          confirmPassText.textfrofield(),
                          const SizedBox(
                            height: 10,
                          ),
                          RaisedButton(
                              onPressed: () async {
                                /* if (_key.currentState!.validate()) {
                                  if (passText.value == confirmPassText.value) {
                                    register(nameText.value, emailText.value,
                                        passText.value);
                                  } else {
                                    print("les mots de passes sont différents");
                                  }
                                } */
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                "Register",
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
                                    "Login",
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
