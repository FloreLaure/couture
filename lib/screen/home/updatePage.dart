// ignore_for_file: file_names

import '/api/api.dart';
import '/model/userModel/postModel.dart';
import '/model/userModel/userModel.dart';
import '/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class PostUser extends StatefulWidget {
  const PostUser({super.key});

  @override
  // ignore: library_private_types_in_public_api
  PostUserState createState() => PostUserState();
}

class PostUserState extends State<PostUser> {
  List<PostModel> postModel = [];
  bool isok = false;
  getPostUser() async {
    setState(() {
      isok = false;
    });
    var data = await Api.getPostUser(UserModel.sessionUser!.id);
    if (data != null) {
      postModel.clear();
      for (Map i in data) {
        setState(() {
          isok = true;
          postModel.add(PostModel.fromJson(i as Map<String, dynamic>));
        });
      }
    } else {
      setState(() {
        isok = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getPostUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier un Post"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              onPressed: () {
                getPostUser();
              }),
        ],
      ),
      body: isok
          ? ListView.builder(
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
                        Text("publier le: ${post.date_post}"),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.green,
                            child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdatePost(
                                                model: post,
                                              )));
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

// ignore: must_be_immutable
class UpdatePost extends StatefulWidget {
  PostModel model;
  UpdatePost({super.key, required this.model});
  @override
  // ignore: library_private_types_in_public_api
  _UpdatePostState createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
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
    titre.initialValue = widget.model.titre;
    detail.initialValue = widget.model.detail;
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
                  "Modifier La Publication",
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
                              myPost.id_post = widget.model.id_post;
                              var result = await Api.updatePost(myPost.toMap());
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
                      "Modifier",
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

// ignore: non_constant_identifier_names
RaisedButton(
    {Future<void> Function()? onPressed,
    required RoundedRectangleBorder shape,
    required Text child,
    required Color color}) {}
