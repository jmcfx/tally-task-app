import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tally_task/core/enum/view_state.dart';
import 'package:tally_task/features/business/domain/entities/business_entity.dart';

part 'business_state.freezed.dart';

@freezed
sealed class BusinessState with _$BusinessState {
  const factory BusinessState({
    @Default(ViewState.idle) ViewState viewState,

    @Default([]) List<BusinessEntity> businesses,

    BusinessEntity? selectedBusiness,

    String? query,

    String? errorMessage,
  }) = _BusinessState;
}
