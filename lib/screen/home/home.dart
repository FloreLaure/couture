import 'package:flutter/foundation.dart';

import '/api/api.dart';
import '/model/userModel/postModel.dart';
import '/model/userModel/userModel.dart';
import '/screen/home/addpage.dart';
import '/screen/home/deletePage.dart';
import '/screen/home/updatePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  final VoidCallback login;
  const Home({super.key, required this.login});
  @override
  // ignore: library_private_types_in_public_api
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Color whiteColor = Colors.white;
  TextStyle style = const TextStyle(color: Colors.white);
  List<PostModel> postModel = [];

  // ignore: non_constant_identifier_names
  get FlatButton => null;
  getdata() async {
    var data = await Api.getPost();
    if (data != null) {
      postModel.clear();
      for (Map i in data) {
        setState(() {
          postModel.add(PostModel.fromJson(i as Map<String, dynamic>));
        });
      }
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page d'accueil"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(
                // ignore: deprecated_member_use
                FontAwesomeIcons.signOutAlt,
                color: Colors.white,
              ),
              onPressed: () {
                widget.login.call();
                UserModel.logOut();
              }),
          IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                if (kDebugMode) {
                  print("test");
                }
                getdata();
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppPost()));
                    },
                    icon: Icon(Icons.add, color: whiteColor),
                    label: Text(
                      "Ajouter",
                      style: style,
                    ),
                    color: Colors.green),
                FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PostUser()));
                    },
                    icon: Icon(Icons.edit, color: whiteColor),
                    label: Text(
                      "Modifier",
                      style: style,
                    ),
                    color: Colors.yellow),
                FlatButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PostUserd()));
                    },
                    icon: Icon(Icons.delete, color: whiteColor),
                    label: Text(
                      "Supprimer",
                      style: style,
                    ),
                    color: Colors.red),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 1.25,
                child: ListView.builder(
                  itemCount: postModel.length,
                  itemBuilder: (context, i) {
                    final post = postModel[i];
                    return Card(
                      color: Colors.green[100],
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(post.titre,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            const Divider(),
                            Text(post.detail),
                            const Divider(),
                            Text("publier le: ${post.date_post}")
                          ],
                        ),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
