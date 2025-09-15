import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tally_task/core/error/exceptions.dart';
import 'package:tally_task/core/network/network_info.dart';
import 'package:tally_task/core/util/map_exception_to_failure.dart';
import 'package:tally_task/core/util/type_def.dart';
import 'package:tally_task/features/business/data/data_sources/local/business_local_data_source.dart';
import 'package:tally_task/features/business/data/data_sources/remote/business_remote_data_source.dart';
import 'package:tally_task/features/business/data/models/business_model.dart';
import 'package:tally_task/features/business/domain/entities/business_entity.dart';
import 'package:tally_task/features/business/domain/repositories/business_repository.dart';

class BusinessRepositoryImpl implements BusinessRepository {
  final BusinessRemoteDataSource _remote;
  final BusinessLocalDataSource _local;
  final NetworkInfo _networkInfo;

  BusinessRepositoryImpl({
    required BusinessRemoteDataSource remote,
    required BusinessLocalDataSource local,
    required NetworkInfo networkInfo,
  }) : _remote = remote,
       _local = local,
       _networkInfo = networkInfo;

  @override
  Future<FailureOr<List<BusinessEntity>>> getBusinesses() async {
    final isConnected = await _networkInfo.isConnected;
    try {
      if (!isConnected) {
        final cached = await _local.getCachedBusinesses();
        return Right(cached.map((m) => m.toEntity()).toList());
      }
      final models = await _remote.getBusinesses();
      await _local.cacheBusinesses(models);
      return Right(models.map((m) => m.toEntity()).toList());
    } on DioException catch (e) {
      return Left(mapExceptionToFailure(e));
    } on CacheException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<FailureOr<BusinessEntity>> getBusinessDetail(String id) async {
    try {
      if (await _networkInfo.isConnected) {
        final models = await _remote.getBusinesses();
        await _local.cacheBusinesses(models);

        final business = models.firstWhere(
          (m) =>
              '${m.name.trim()}_${m.contact.replaceAll(' ', '')}'.hashCode
                  .toString() ==
              id,
          orElse: () => throw ServerException(),
        );

        return Right(business.toEntity());
      } else {
        final cached = await _local.getCachedBusinesses();
        final business = cached.firstWhere(
          (m) =>
              '${m.name.trim()}_${m.contact.replaceAll(' ', '')}'.hashCode
                  .toString() ==
              id,
          orElse: () => throw CacheException(),
        );

        return Right(business.toEntity());
      }
    } on DioException catch (e) {
      return Left(mapExceptionToFailure(e));
    } on CacheException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }

  @override
  Future<FailureOr<List<BusinessEntity>>> searchBusinesses(String query) async {
    try {
      final cached = await _local.getCachedBusinesses();
      final results = cached
          .where(
            (m) =>
                m.name.toLowerCase().contains(query.toLowerCase()) ||
                m.location.toLowerCase().contains(query.toLowerCase()),
          )
          .map((m) => m.toEntity())
          .toList();
      return Right(results);
    } on DioException catch (e) {
      return Left(mapExceptionToFailure(e));
    } on CacheException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
