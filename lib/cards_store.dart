import 'package:hive/hive.dart';
part 'cards_store.g.dart';

//RUN THIS for developing with hive
//! flutter pub run build_runner watch --delete-conflicting-outputs

@HiveType(typeId: 0)
class CardInfo extends HiveObject {
  @HiveField(0)
  late String passwordFormURL;

  @HiveField(1)
  late String passwordFormUsername;

  @HiveField(2)
  late String passwordFormPassword;

  @HiveField(3)
  late String passwordTOTPUrl;

  @HiveField(4)
  late String iconUrl;

  @HiveField(5)
  late String iconType;

  CardInfo(
      this.passwordFormURL,
      this.passwordFormUsername,
      this.passwordFormPassword,
      this.passwordTOTPUrl,
      this.iconUrl,
      this.iconType);
}
