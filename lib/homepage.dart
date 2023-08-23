import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'database.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  


  Stream<List<Videos>> getVideos() => FirebaseFirestore.instance
  .collection('test_videos')
  .snapshots()
  .map((snapshot) => snapshot.docs.map((videos) => Videos.fromJson(videos.data())).toList()
  );


  Widget movie(Videos videos) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(width: 2, color: Color.fromARGB(255, 0, 0, 0)), borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
                          children: [
                            InkWell(
                                onTap: () => launchUrl(Uri.parse(videos.url), mode: LaunchMode.externalNonBrowserApplication),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Text(
                                                  videos.name,
                                                  style: TextStyle(fontSize: 20, ),
                                                )
                                              ),
                                    ),
                                    Container(
                                            height: 150,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 50),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        videos.cover_pic,), fit: BoxFit.fill)),
                                          ),
                                  ]
                                  ),
                              ),
                              ],
                            ),
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        title: Text("S-SevenProject",),
        centerTitle: true,
      ),
      body: 
            StreamBuilder<List<Videos>>(
              stream: getVideos(),
              builder: (context,  snapshot) {
                
                if(snapshot.hasError)
                {
                  return Center(
                    child: AlertDialog(
                      content: Text("Something Went Wrong",),
                      actions: [
                        Text('')
                      ],
                    ),
                  );
                }
                else if (snapshot.hasData)
                {
                  final list = snapshot.data;
                  
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    children: list!.map(movie).toList(),
                  );
                }
                else
                {
                  return Center(
                  child: CircularProgressIndicator(),
                );
                }
              }
            )
    );
  }  
}
