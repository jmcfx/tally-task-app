import 'package:flutter/material.dart';
import 'package:tally_task/core/enum/view_state.dart';
import 'package:tally_task/features/business/domain/use_cases/get_business_detail_use_case.dart';
import 'package:tally_task/features/business/domain/use_cases/get_businesses_use_case.dart';
import 'package:tally_task/features/business/domain/use_cases/search_businesses_use_case.dart';
import 'package:tally_task/features/business/presentation/provider/business_state.dart';

class BusinessProvider extends ChangeNotifier {
  final GetBusinessesUseCase _getBusinesses;
  final GetBusinessDetailUseCase _getBusinessDetail;
  final SearchBusinessesUseCase _searchBusinesses;

  BusinessProvider({
    required GetBusinessesUseCase getBusinesses,
    required GetBusinessDetailUseCase getBusinessDetail,
    required SearchBusinessesUseCase searchBusinesses,
  }) : _getBusinesses = getBusinesses,
       _getBusinessDetail = getBusinessDetail,
       _searchBusinesses = searchBusinesses;

  BusinessState _state = const BusinessState();
  BusinessState get state => _state;

  /// stores the last attempted action so the can be a [Retry]
  VoidCallback? _lastAction;

  void _updateState(BusinessState newState, {VoidCallback? lastAction}) {
    _state = newState;
    _lastAction = lastAction ?? _lastAction;
    notifyListeners();
  }

  Future<void> fetchBusinesses() async {
    _updateState(
      _state.copyWith(viewState: ViewState.loading),
      lastAction: fetchBusinesses,
    );

    final result = await _getBusinesses(());
    result.fold(
      (failure) => _updateState(
        _state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (result) => _updateState(
        _state.copyWith(
          businesses: result,
          viewState: result.isEmpty ? ViewState.idle : ViewState.success,
          errorMessage: null,
        ),
      ),
    );
  }

  /// fetchBusiness Details Method..
  Future<void> fetchBusinessDetail(String id) async {
    _updateState(
      _state.copyWith(viewState: ViewState.loading),
      lastAction: () => fetchBusinessDetail(id),
    );

    final result = await _getBusinessDetail((businessId: id));
    result.fold(
      (failure) => _updateState(
        _state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (result) => _updateState(
        _state.copyWith(selectedBusiness: result, viewState: ViewState.success),
      ),
    );
  }

  /// search Method ...
  Future<void> search(String query) async {
    _updateState(
      _state.copyWith(viewState: ViewState.loading, query: query),
      lastAction: () => search(query),
    );

    final result = await _searchBusinesses((query: query));
    result.fold(
      (failure) => _updateState(
        _state.copyWith(
          viewState: ViewState.error,
          errorMessage: failure.message,
        ),
      ),
      (result) => _updateState(
        _state.copyWith(
          businesses: result,
          viewState: result.isEmpty ? ViewState.idle : ViewState.success,
        ),
      ),
    );
  }

  ///  retry last failed action...
  void retry() {
    _lastAction?.call();
  }
}
