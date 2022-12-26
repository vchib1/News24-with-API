import 'package:flutter/material.dart';
import 'package:newswithapi/Constants/Constants.dart';
import 'package:newswithapi/widgets/article_web_view.dart';
import 'package:shimmer/shimmer.dart';

class NewsWidget extends StatelessWidget {
  final String imageUrl;
  final String articleUrl;
  final String title;
  final String description;

  const NewsWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.articleUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 5),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ArticleWebView(articleUrl: articleUrl)));
          },
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      title,
                      style: breakingNewsTitleStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      description,
                      style: descriptionTextStyle,
                    ),
                  ),
                  const Divider(
                    color: dividerColor,
                    thickness: dividerThickness,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 5),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: customBoxDecoration(),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 30,
                        decoration: customBoxDecoration()
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        height: 20,
                        decoration: customBoxDecoration()
                      ),
                    )
                ),
                const Divider(
                  color: dividerColor,
                  thickness: dividerThickness,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration customBoxDecoration() {
    return BoxDecoration(
        // gradient: LinearGradient(colors: [
        //   Colors.grey.shade200,
        //   Colors.grey.shade300,
        // ]),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12));
  }
}
