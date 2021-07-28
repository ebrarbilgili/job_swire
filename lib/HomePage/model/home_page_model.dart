import 'package:json_annotation/json_annotation.dart';

part 'home_page_model.g.dart';

@JsonSerializable()
class HomePageModel {
  String? slug;
  String? id;
  String? epoch;
  String? date;
  String? company;
  String? companyLogo;
  String? position;
  List<String>? tags;
  String? logo;
  String? description;
  String? location;
  String? url;
  String? applyUrl;

  HomePageModel({
    this.slug,
    this.id,
    this.epoch,
    this.date,
    this.company,
    this.companyLogo,
    this.position,
    this.tags,
    this.logo,
    this.description,
    this.location,
    this.url,
    this.applyUrl,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    return _$HomePageModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomePageModelToJson(this);
  }
}
