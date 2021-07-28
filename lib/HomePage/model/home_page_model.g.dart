// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageModel _$HomePageModelFromJson(Map<String, dynamic> json) {
  return HomePageModel(
    slug: json['slug'] as String?,
    id: json['id'] as String?,
    epoch: json['epoch'] as String?,
    date: json['date'] as String?,
    company: json['company'] as String?,
    companyLogo: json['companyLogo'] as String?,
    position: json['position'] as String?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    logo: json['logo'] as String?,
    description: json['description'] as String?,
    location: json['location'] as String?,
    url: json['url'] as String?,
    applyUrl: json['applyUrl'] as String?,
  );
}

Map<String, dynamic> _$HomePageModelToJson(HomePageModel instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'id': instance.id,
      'epoch': instance.epoch,
      'date': instance.date,
      'company': instance.company,
      'companyLogo': instance.companyLogo,
      'position': instance.position,
      'tags': instance.tags,
      'logo': instance.logo,
      'description': instance.description,
      'location': instance.location,
      'url': instance.url,
      'applyUrl': instance.applyUrl,
    };
