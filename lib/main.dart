import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:http/http.dart';
import 'WebService.dart';
import 'NewsArticle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage()
    );
  }
}

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<NewsArticle> _newsArticles = List<NewsArticle>();

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }


  void _populateNewsArticles() {

    Webservice().load(NewsArticle.all).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
//            DrawerHeader(
//              decoration: BoxDecoration(
//                color: Colors.blue
//              ),
//              child: Column(
//                children: <Widget>[
//                  CircleAvatar(
//                    radius: 40,
//                  ),
//                  SizedBox(
//                    height: 10.0,
//                  ),
//                  Text('Ayomikun Adegoke')
//                ],
//              )
//            ),
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"),),
            accountEmail: Text('ayomikunadegoke@gmail.com'),
            accountName: Text('Ayomikun Adegoke'),
          ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
                Scaffold.of(context).showSnackBar(snackBar);
                ScaffoldState().showSnackBar(snackBar);
              },
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Info'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              trailing: Icon(Icons.edit),
            ),
          ],
        ),

      ),
      body: ListView.builder(

        physics: BouncingScrollPhysics(),
        itemCount: _newsArticles.length,
          itemBuilder: (context, position){
            return Container(
              padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                  color: Colors.grey[200],
                  blurRadius: 4.0,
                  spreadRadius: 3.5,
                  offset: Offset(0.0, 2)),
                ]
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:  NetworkImage(_newsArticles[position].urlToImage),
                  ),

                  XMargin(30),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_newsArticles[position].title, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.start, ),
                        YMargin(10),
                        Text(_newsArticles[position].descrption)
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}