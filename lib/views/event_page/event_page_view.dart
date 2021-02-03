library event_page_view;

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'event_page_view_model.dart';

part 'event_page_mobile.dart';
part 'event_page_tablet.dart';
part 'event_page_desktop.dart';

class EventPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventPageViewModel>.reactive(
      viewModelBuilder: () => EventPageViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (BuildContext context, EventPageViewModel viewModel, Widget child) {
        return ScreenTypeLayout(
          mobile: _EventPageMobile(viewModel),
          desktop: _EventPageDesktop(viewModel),
          tablet: _EventPageTablet(viewModel),  
        );
      }
    );
  }
}
