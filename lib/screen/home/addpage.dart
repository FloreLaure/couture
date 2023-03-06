import 'package:couture_mobile/screen/home/updatePage.dart';

import '/api/api.dart';
import '/model/userModel/postModel.dart';
import '/model/userModel/userModel.dart';
import '/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class AppPost extends StatefulWidget {
  const AppPost({super.key});

  @override
  // ignore: library_private_types_in_public_api
  AppPostState createState() => AppPostState();
}

class AppPostState extends State<AppPost> {
  @override
  void initState() {
    super.initState();
  }

  CustomTextField titre = CustomTextField(
      placeholder: "Entrer le titre", title: "Titre", initialValue: '');
  CustomTextField detail = CustomTextField(
      placeholder: "Entrer le detail",
      title: "Détail",
      line: 5,
      initialValue: '');
  PostModel myPost =
      PostModel(date_post: '', detail: '', id_post: '', titre: '', user: '');
  bool post = false;

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    titre.err = "veillez entrer le titre";
    detail.err = "veillez entrer le detail";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un Post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Nouvelle Publication",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                titre.textfrofield(),
                const SizedBox(
                  height: 10,
                ),
                detail.textfrofield(),
                const SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    onPressed: post
                        ? null
                        : () async {
                            if (_key.currentState!.validate()) {
                              setState(() {
                                post = true;
                              });
                              myPost.titre = titre.value;
                              myPost.detail = detail.value;
                              myPost.user = UserModel.sessionUser!.id;
                              var result = await Api.addPost(myPost.toMap());
                              if (result != null && result[0]) {
                                setState(() {
                                  post = false;
                                });
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pop();
                              } else if (result != null && !result[0]) {
                                setState(() {
                                  post = false;
                                });
                              } else {
                                setState(() {
                                  post = false;
                                });
                              }
                            }
                          },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Publier",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.redAccent.withOpacity(.7)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
