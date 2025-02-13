
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:git_hub_mobile_app/repository/GitRepositoriesPage.page.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
//  const UsersPage({super.key});
  String  query='';
  bool notVisible=false;

  TextEditingController queryTextEditingController=TextEditingController();
  int currentPage=0;
  int totalPages=0;
  int pageSize=20;
  dynamic data;
  ScrollController scrollController=ScrollController();
  List<dynamic> items=[];
 void _search(String query ){
   String url="https://api.github.com/search/users?q=$query&per_page=$pageSize&page=$currentPage";
   Uri uri=Uri.parse(url);
   if (kDebugMode) {
     print(uri);
   }
   http.get(uri).then((response) {
     if (response.statusCode == 200) {
       // Handle successful response
       if (kDebugMode) {
       //  print('Response: ${response.body}');
         setState(() {
           data=json.decode(response.body);
           items.addAll(data['items']);
           if(data['total_count']%pageSize==0) {
             totalPages = data['total_count'] ~/ pageSize;
           }else {
             totalPages = (data['total_count']/ pageSize).floor()+1;
           }
         });

       }
     } else {
       // Handle unsuccessful responses
       if (kDebugMode) {
         print('Error: ${response.statusCode}');
       }
     }
   }).catchError((error) {
     // Handle network errors
     if (kDebugMode) {
       print('Network Error: $error');
     }
     // Possibly show a user-friendly message
   });
 }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels==scrollController.position.maxScrollExtent) {
         setState(() {
           if(currentPage<totalPages-1){
             ++currentPage;
           _search(query);
           }
         });
      }
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(title:  Text('Users => $query => $currentPage/$totalPages'),),
        body:  Column(
          children: [
            Row(
                children: [
                  Expanded (
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            obscureText: notVisible,
                            onChanged: (value){
                              setState(() {
                                query=value;
                              });
                            },
                            controller: queryTextEditingController,
                            decoration: InputDecoration(
                              // icon: const Icon(Icons.abc),
                                suffixIcon: IconButton(onPressed:(){
                                 setState(() {
                                   notVisible=!notVisible;
                                 });
                                }, icon:  Icon(
                                 notVisible==true?Icons.visibility_off:Icons.visibility
                                )),
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular( 50),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.deepOrange
                                    )
                                )
                            ),
                          )

                      )

                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      query = queryTextEditingController.text; // Update the query
                      _search(query);
                    });
                    if (kDebugMode) {
                      print(query);
                    }
                  }, icon: const Icon(Icons.search))
                ]
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context,index)=> const Divider(height: 2, color: Colors.deepOrange,),
                controller: scrollController,
                  itemCount: items.length,
                  itemBuilder: (context,index){
                    var login = items[index]['login'];
                  //  print('User login: $login'); // Print the actual login for debugging

                    return  ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context)=>GitRepositoriesPage(items[index]['login'],items[index]['avatar_url'])));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(items[index]['avatar_url'] ),
                                radius: 40,
                              ),
                              const SizedBox(width: 20,),
                              Text(items[index]['login']),

                            ]
                            ,
                          ),
                          CircleAvatar(
                            child: Text(  items[index]['score'].toString()),
                          )
                        ],
                      ),
                    );
              

                  }
              
              
              ),
            )
          ],
        )
    );
  }
}

