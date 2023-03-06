// ignore_for_file: file_names

import 'package:flutter/foundation.dart';

import '/api/api.dart';
import '/model/userModel/postModel.dart';
import '/model/userModel/userModel.dart';
import 'package:flutter/material.dart';

class PostUserd extends StatefulWidget {
  const PostUserd({super.key});

  @override
  // ignore: library_private_types_in_public_api
  PostUserdState createState() => PostUserdState();
}

class PostUserdState extends State<PostUserd> {
  List<PostModel> postModel = [];
  bool isok = false;
  getPostUser() async {
    setState(() {
      isok = false;
    });
    var data = await Api.getPostUser(UserModel.sessionUser!.id);
    if (data != null) {
      postModel.clear();
      setState(() {
        isok = true;
      });
      for (Map i in data) {
        setState(() {
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

  final key = GlobalKey<FormState>();
  List<bool> valueCheck = [];
  List idposts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Supprimer un Post"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                if (idposts.isNotEmpty) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Supprimer"),
                          content: const Text("Voulez-vous supprimer?"),
                          actions: [
                            FlatButton(
                                onPressed: () async {
                                  var isdelete = await Api.deletePost(idposts);
                                  if (isdelete != null) {
                                    if (isdelete[0]) {
                                      setState(() {
                                        idposts.clear();
                                        Navigator.of(context).pop();
                                        getPostUser();
                                      });
                                    }
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text("Oui")),
                            FlatButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Non")),
                          ],
                        );
                      });
                }
              }),
        ],
      ),
      body: isok
          ? ListView.builder(
              itemCount: postModel.length,
              itemBuilder: (context, i) {
                final post = postModel[i];
                valueCheck.add(false);
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
                            child: Checkbox(
                              value: valueCheck[i],
                              onChanged: (value) {
                                setState(() {
                                  valueCheck[i] = value!;
                                  if (valueCheck[i]) {
                                    idposts.add(post.id_post);
                                  } else {
                                    idposts.remove(post.id_post);
                                  }
                                  if (kDebugMode) {
                                    print(idposts);
                                  }
                                });
                              },
                            )),
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

// ignore: non_constant_identifier_names
FlatButton({required Future<void> Function() onPressed, required Text child}) {}
