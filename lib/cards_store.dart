import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'cards_store.g.dart';

//RUN THIS for developing with hive
//! flutter pub run build_runner watch --delete-conflicting-outputs

@HiveType(typeId: 0)
class CardInfo extends HiveObject {
  @HiveField(0)
  late final Widget card;

  @HiveField(1)
  late final String passwordFormURL;

  @HiveField(2)
  late final String passwordFormUsername;

  @HiveField(3)
  late final String passwordFormPassword;

  @HiveField(4)
  late final String passwordTOTPUrl;

  CardInfo(this.card, this.passwordFormURL, this.passwordFormUsername, this.passwordFormPassword, this.passwordTOTPUrl);
}
