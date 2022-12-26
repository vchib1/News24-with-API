import 'dart:convert';
import 'package:flutter/material.dart';
import '../Constants/Constants.dart';
import '../widgets/news_widget.dart';
import 'package:http/http.dart' as http;


class LatestPage extends StatefulWidget {
  const LatestPage({Key? key}) : super(key: key);

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {

  List<dynamic> news = [];

  bool _loadingData = true;

  Future<void> getBreakingNews()async{

    const url = "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=c760583740784a958e00124a73857183";

    final uri = Uri.parse(url);

    final response = await http.get(uri);
    final responseBody = response.body;

    final json = jsonDecode(responseBody);

    if(response.statusCode == 200){
      Future.delayed(const Duration(seconds: dataLoadingTime),(){
        setState(() {
          news = json['articles'];
          _loadingData = false;
        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBreakingNews();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        setState(() {
          _loadingData = true;
        });
        return getBreakingNews();
      },
      child: Scaffold(
        body: _loadingData ?
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context,index){
            return const ShimmerEffect();
          },
        )
            :
        ListView.builder(
          itemCount: news.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context,index){
            return NewsWidget(
              title: news[index]['title'] ?? "",
              imageUrl: news[index]['urlToImage'] ?? "https://i.stack.imgur.com/WeyM8.jpg",
              description: news[index]['description'] ?? "",
              articleUrl: news[index]['url'] ?? "",
            );
          },
        ),
      ),
    );
  }
}


