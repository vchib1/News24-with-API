import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Constants/Constants.dart';

class ArticleWebView extends StatelessWidget {
  const ArticleWebView({Key? key,required this.articleUrl}) : super(key: key);
  final String articleUrl;
  @override
  Widget build(BuildContext context) {

    final Completer<WebViewController> completer = Completer<WebViewController>();

    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: const [
              Text("News",style: TextStyle(fontWeight: FontWeight.bold),),
              Text(" 24",style: TextStyle(color: mainColor,fontWeight: FontWeight.bold),),
            ],
          )),
      body: SizedBox(
          child: WebView(
            initialUrl: articleUrl,
            onWebViewCreated: ((WebViewController webViewController){
              completer.complete(webViewController);
            }),
          )
      ),
    );
  }
}
