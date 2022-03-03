// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageModel _$PageModelFromJson(Map<String, dynamic> json) => PageModel()
  ..per = json['per'] as int? ?? 0
  ..total = json['total'] as int? ?? 0
  ..page = json['page'] as int? ?? 0;

Map<String, dynamic> _$PageModelToJson(PageModel instance) => <String, dynamic>{
      'per': instance.per,
      'total': instance.total,
      'page': instance.page,
    };
