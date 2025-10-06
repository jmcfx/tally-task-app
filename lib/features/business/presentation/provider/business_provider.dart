import 'package:flutter/material.dart';
import 'package:tally_task/core/enum/view_state.dart';
import 'package:tally_task/features/business/domain/use_cases/get_business_detail_use_case.dart';
import 'package:tally_task/features/business/domain/use_cases/get_businesses_use_case.dart';
import 'package:tally_task/features/business/domain/use_cases/search_businesses_use_case.dart';
import 'package:tally_task/features/business/presentation/provider/business_state.dart';

class BusinessProvider {
  final GetBusinessesUseCase _getBusinesses;
  final GetBusinessDetailUseCase _getBusinessDetail;
  final SearchBusinessesUseCase _searchBusinesses;

  /// The notifier that holds the current business state
  final ValueNotifier<BusinessState> stateNotifier =
      ValueNotifier<BusinessState>(const BusinessState());

  BusinessState get state => stateNotifier.value;

  /// Last attempted action (for retry)
  VoidCallback? _lastAction;

  BusinessProvider({
    required GetBusinessesUseCase getBusinesses,
    required GetBusinessDetailUseCase getBusinessDetail,
    required SearchBusinessesUseCase searchBusinesses,
  }) : _getBusinesses = getBusinesses,
       _getBusinessDetail = getBusinessDetail,
       _searchBusinesses = searchBusinesses;

  void _updateState(BusinessState newState, {VoidCallback? lastAction}) {
    stateNotifier.value = newState;
    _lastAction = lastAction ?? _lastAction;
  }

  Future<void> fetchBusinesses() async {
    _updateState(
      state.copyWith(viewState: ViewState.loading),
      lastAction: fetchBusinesses,
    );

    final result = await _getBusinesses(());
    result.fold(
      (failure) => _updateState(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (result) => _updateState(
        state.copyWith(
          businesses: result,
          viewState: result.isEmpty ? ViewState.idle : ViewState.success,
          errorMessage: null,
        ),
      ),
    );
  }

  Future<void> fetchBusinessDetail(String id) async {
    _updateState(
      state.copyWith(viewState: ViewState.loading),
      lastAction: () => fetchBusinessDetail(id),
    );

    final result = await _getBusinessDetail((businessId: id));
    result.fold(
      (failure) => _updateState(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (result) => _updateState(
        state.copyWith(selectedBusiness: result, viewState: ViewState.success),
      ),
    );
  }

  Future<void> search(String query) async {
    _updateState(
      state.copyWith(viewState: ViewState.loading, query: query),
      lastAction: () => search(query),
    );

    final result = await _searchBusinesses((query: query));
    result.fold(
      (failure) => _updateState(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (result) => _updateState(
        state.copyWith(
          businesses: result,
          viewState: result.isEmpty ? ViewState.idle : ViewState.success,
        ),
      ),
    );
  }

  void retry() => _lastAction?.call();
}
