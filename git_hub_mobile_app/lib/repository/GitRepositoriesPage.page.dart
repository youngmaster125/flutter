
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GitRepositoriesPage extends StatefulWidget {
  //const GitRepositoriesPage({super.key});
  String login,avatarUrl;
 GitRepositoriesPage(this.login, this.avatarUrl, {super.key});

  @override
  State<GitRepositoriesPage> createState() => _GitRepositoriesPageState();
}


class _GitRepositoriesPageState extends State<GitRepositoriesPage> {
  dynamic dataRepositories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadRepositories();
  }
  Future<void> loadRepositories() async {
    String url = "https://api.github.com/users/${widget.login}/repos";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if(response.statusCode==200){
      setState(() {
        dataRepositories=json.decode( response.body);
      });

      // print(dataRepositories['name']);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Repositories ${widget.login}"),
        actions: [
          CircleAvatar(
            backgroundImage:NetworkImage(widget.avatarUrl) ,)
        ],
      ),
      body:  Center(
        child: ListView.separated(
            itemBuilder: (context,index)=>ListTile(
              title: Text(dataRepositories[index]['name']),
            ),
            separatorBuilder:(context,index)=> const Divider(height: 2,color: Colors.blue,),
            itemCount: dataRepositories==null?0:dataRepositories.length
        ),
      ),
    );
  }
}