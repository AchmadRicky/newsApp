import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/listwidget.dart';
import 'package:news/shared/listitem.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:provider/provider.dart';
import 'details.dart';
import 'wrapper.dart';
import 'auth_service.dart';
import 'profil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.firebaseUserStream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<ListItem> listTiles = [
    ListItem(
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "28 Jan 2020",
    ),
    ListItem(
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "03 Mar 2021",
    ),
    ListItem(
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "28 Mei 2020",
    ),
    ListItem(
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "28 Mei 2020",
    ),
    ListItem(
      "https://images.unsplash.com/photo-1582719508461-905c673771fd?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1525&q=80",
      lipsum.createWord(numWords: 6),
      lipsum.createWord(numWords: 2),
      "28 Mei 2020",
    ),
  ];

  List<Tab> _tabList = [
    Tab(
      child: Text("Terbaru"),
    ),
    Tab(
      child: Text("Viral"),
    ),
    Tab(
      child: Text("Lokal"),
    ),
    Tab(
      child: Text("Internasional"),
    ),
  ];

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 95.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text(
          "News App",
          style: TextStyle(color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            item: listTiles[index],
                            tag: listTiles[index].newsTitle,
                          ),
                        ),
                      );
                    },
                    child: listWidget(listTiles[index]),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
