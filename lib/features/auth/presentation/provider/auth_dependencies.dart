import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_provider.dart';

import '../../data/datasource/auth_remote_datasource.dart';

import '../../data/repository/auth_remote_datasource_impl.dart';
import '../../data/repository/auth_repository_impl.dart';

final authRemoteDataSourceProvider =
Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(
    ref.read(dioProvider).dio,
  );
});

final authRepositoryProvider =
Provider<AuthRepositoryImpl>((ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDataSourceProvider),
  );
});