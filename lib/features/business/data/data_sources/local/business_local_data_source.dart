import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tally_task/core/constants/storage_keys.dart';
import 'package:tally_task/features/business/data/models/business_model.dart';

abstract interface class BusinessLocalDataSource {
  /// Caches a list of [BusinessModel]s.
  Future<void> cacheBusinesses(List<BusinessModel> models);
  /// Retrieves a cached list of [BusinessModel]s, or null if no cache exists.
  Future<List<BusinessModel>> getCachedBusinesses();
}

class BusinessLocalDataSourceImpl implements BusinessLocalDataSource {
  final SharedPreferences _pref;

  BusinessLocalDataSourceImpl({required SharedPreferences pref}) : _pref = pref;

  @override
  Future<void> cacheBusinesses(List<BusinessModel> models) async {
    final jsonList = models.map((m) => m.toJson()).toList();
    await _pref.setString(StorageKeys.businesses, jsonEncode(jsonList));
  }

  @override
  @override
  Future<List<BusinessModel>> getCachedBusinesses() async {
    final jsonString = _pref.getString(StorageKeys.businesses);
    // if jsonString is null or Empty....
    if (jsonString == null || jsonString.isEmpty) return [];
    try {
      final List decoded = jsonDecode(jsonString);
      return decoded
          .map((e) => BusinessModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    } catch (_) {
       // corrupted cache -> clear or return empty
      await _pref.remove(StorageKeys.businesses);
      return [];
    }
  }
}
