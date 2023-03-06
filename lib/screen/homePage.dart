// ignore_for_file: file_names

import 'package:couture_mobile/model/userModel/userModel.dart';
import 'package:couture_mobile/screen/home/home.dart';

import 'package:flutter/material.dart';

import 'package:couture_mobile/screen/authentification/login.dart';

/* class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  HomePageState createState() =>  HomePageState();
}

abstract class HomePageState extends State<HomePage> {
  bool visible = true, login = false;
  isconnected() async {
    await UserModel.getUser();
    if (UserModel.sessionUser == null) {
      setState(() {
        login = false;
      });
    } else {
      setState(() {
        login = true;
      });
    }
  }

  toggle() {
    setState(() {
      visible = !visible;
    });
  }

  islogin() {
    setState(() {
      login = !login;
    });
  }

  @override
  void initState() {
    // ignore: todo
    super.initState();
    isconnected();
  }
} */

/* import 'package:flutter/material.dart';
import 'package:your_app_name/login_page.dart';
import 'package:your_app_name/home_page.dart';
import 'package:your_app_name/user_model.dart';
 */

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = true, login = false;

  void isconnected() async {
    await UserModel.getUser();
    if (UserModel.sessionUser == null) {
      setState(() {
        login = false;
      });
    } else {
      setState(() {
        login = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isconnected();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login ? HomeState() : pagelogin_(),
    );
  }
}

pagelogin_() {}
