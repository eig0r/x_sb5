import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:x_sb5/core/locator.dart';
import 'package:x_sb5/core/logger.dart';
import 'package:x_sb5/core/router_constants.dart';
//import 'package:x_sb5/views/signup/signup_view.dart';

class SplashViewModel extends BaseViewModel {
  Logger log;
  final NavigationService _navigationService = locator<NavigationService>();

  SplashViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  NaviToView() {
    _navigationService.navigateTo(signUpViewRoute);
  }
}
