import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:x_sb5/core/locator.dart';
import 'package:x_sb5/core/logger.dart';
import 'package:x_sb5/core/router_constants.dart';
//import 'package:x_sb5/views/signup/signup_view.dart';

class SignupOdooViewModel extends BaseViewModel {
  Logger log;
  final NavigationService _navigationService = locator<NavigationService>();

  SignupOdooViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }

  // ignore: non_constant_identifier_names
  NaviToView() {
    _navigationService.navigateTo(eventViewRoute);
  }
}
