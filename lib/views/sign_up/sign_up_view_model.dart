import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:x_sb5/core/logger.dart';

class SignUpViewModel extends BaseViewModel {
  Logger log;

  SignUpViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
