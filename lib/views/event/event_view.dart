library splash_view;

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'event_view_model.dart';

part 'event_mobile.dart';

class EventView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventViewModel>.reactive(
        viewModelBuilder: () => EventViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder:
            (BuildContext context, EventViewModel viewModel, Widget child) {
          return ScreenTypeLayout(
            mobile: _EventMobile(viewModel),
            // desktop: _SplashDesktop(viewModel),
            // tablet: _SplashTablet(viewModel),
          );
        });
  }
}
