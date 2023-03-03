import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_notifier.freezed.dart';

@freezed
abstract class StartUp with _$StartUp {
  const factory StartUp.onboarding() = Onboarding;
  const factory StartUp.home() = Home;
  const factory StartUp.loggedIn() = LoggedIn;
  const factory StartUp.isFirstTime() = isFirstTime;
}

