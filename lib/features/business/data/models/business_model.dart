// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tally_task/features/business/domain/entities/business_entity.dart';

part 'business_model.freezed.dart';
part 'business_model.g.dart';

@freezed
sealed class BusinessModel with _$BusinessModel {
  const factory BusinessModel({
    @JsonKey(name: 'biz_name') required String name,
    @JsonKey(name: 'bss_location') required String location,
    @JsonKey(name: 'contct_no') required String contact,
  }) = _BusinessModel;

  factory BusinessModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessModelFromJson(json);
}

extension BusinessModelX on BusinessModel {
  BusinessEntity toEntity() {
    final cleanName = name.trim();
    final cleanLocation = location.trim();
    final cleanContact = contact.replaceAll(' ', '');
    return (
      id: '${cleanName}_$cleanContact'.hashCode.toString(),
      name: cleanName,
      location: cleanLocation,
      contact: cleanContact,
    );
  }
}
