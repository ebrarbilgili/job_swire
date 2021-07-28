import 'package:flutter/material.dart';
import 'package:job_swire/HomePage/controller/home_page_controller.dart';
import 'package:job_swire/HomePage/model/home_page_model.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobSwire'),
      ),
      body: FutureBuilder<List<HomePageModel>>(
        future: context.read<HomePageController>().getHttpData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              final data = snapshot.data![index];
              return Card(
                child: ListTile(
                  leading: buildImage(data),
                  title: buildTitle(data),
                  subtitle: buildSubtitle(data, context),
                  onTap: () {
                    buildModalBottomSheet(context, data);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<dynamic> buildModalBottomSheet(
      BuildContext context, HomePageModel data) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  data.position ?? 'No position',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(data.description ?? 'No description'),
              ),
            ],
          ),
        );
      },
    );
  }

  Text buildTitle(HomePageModel data) => Text(data.position ?? 'No position');

  Column buildSubtitle(HomePageModel data, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLocation(data),
        buildTags(context, data),
      ],
    );
  }

  Text buildLocation(HomePageModel data) =>
      Text(data.location ?? 'No location');

  SizedBox buildTags(BuildContext context, HomePageModel data) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      child: ListView.builder(
        itemCount: data.tags?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(color: Colors.black),
            ),
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('${data.tags?[index].toString()}'),
            ),
          );
        },
      ),
    );
  }

  CircleAvatar buildImage(HomePageModel data) {
    return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 32,
        child: Image.network(
          data.logo ?? '',
          scale: 2,
          errorBuilder: (context, error, stackTrace) => Text('No Image'),
        ));
  }
}
