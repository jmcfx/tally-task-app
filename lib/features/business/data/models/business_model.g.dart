// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessModel _$BusinessModelFromJson(Map<String, dynamic> json) =>
    _BusinessModel(
      businessName: json['biz_name'] as String,
      location: json['bss_location'] as String,
      contact: json['contct_no'] as String,
    );

Map<String, dynamic> _$BusinessModelToJson(_BusinessModel instance) =>
    <String, dynamic>{
      'biz_name': instance.businessName,
      'bss_location': instance.location,
      'contct_no': instance.contact,
    };
