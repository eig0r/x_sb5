import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:x_sb5/core/logger.dart';

class EventPageViewModel extends BaseViewModel {
  Logger log;

  EventPageViewModel() {
    this.log = getLogger(this.runtimeType.toString());
  }
}
