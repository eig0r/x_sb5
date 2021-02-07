library splash_view;

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:x_sb5/base.dart';
import 'package:x_sb5/data/pojo/user.dart';
import 'package:x_sb5/services/services_odoo/odoo_api.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'signupodoo_view_model.dart';
part 'signupodoo_mobile.dart';

class SignupOdooView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupOdooViewModel>.reactive(
        viewModelBuilder: () => SignupOdooViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (BuildContext context, SignupOdooViewModel viewModel,
            Widget child) {
          return ScreenTypeLayout(
            mobile: _SignupOdooMobile(viewModel),
            // desktop: _SplashDesktop(viewModel),
            // tablet: _SplashTablet(viewModel),
          );
        });
  }
}
