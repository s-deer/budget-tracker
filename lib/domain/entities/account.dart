import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

enum AccountType {
  savings,
}

@freezed
class Account with _$Account {
  const factory Account({
    required String id,
    required String name,
    required AccountType type,
    required int balance,
    required int index,
    required String description,
    required bool archive,
    required bool includeInBalance,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Account;
}
