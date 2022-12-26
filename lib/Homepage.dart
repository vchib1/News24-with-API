import 'package:flutter/material.dart';
import 'package:newswithapi/Constants/Constants.dart';
import 'package:newswithapi/pages/business.dart';
import 'package:newswithapi/pages/entertainment.dart';
import 'package:newswithapi/pages/health.dart';
import 'package:newswithapi/pages/latest.dart';
import 'package:newswithapi/pages/science.dart';
import 'package:newswithapi/pages/sports.dart';
import 'package:newswithapi/pages/tech.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
              Text("News",style: TextStyle(fontWeight: FontWeight.bold),),
              Text(" 24",style: TextStyle(color: mainColor,fontWeight: FontWeight.bold),),
            ],
          ),
          actions: [
            PopupMenuButton(itemBuilder: (context) => [
              PopupMenuItem(
                  child: GestureDetector(
                    onTap: (){},
                      child: Icon(Icons.language))
              )
            ])
          ],
          bottom: const TabBar(
            isScrollable: true,
            indicatorWeight: 3,
            physics: ClampingScrollPhysics(),

            unselectedLabelColor: blackColor,
            labelColor: mainColor,
            labelStyle: tabBarTextStyle,
            indicatorColor: mainColor,
            tabs: [
              Tab(child: Text("Latest")),
              Tab(child: Text("Business")),
              Tab(child: Text("Entertainment")),
              Tab(child: Text("Sports")),
              Tab(child: Text("Science")),
              Tab(child: Text("Health")),
              Tab(child: Text("Tech")),
            ]
          ),
        ),
        body: const TabBarView(
          children: [
            LatestPage(),
            BusinessPage(),
            EntertainmentPage(),
            SportsPage(),
            SciencePage(),
            HealthPage(),
            TechPage(),
          ],
        ),
      ),
    );
  }
}
