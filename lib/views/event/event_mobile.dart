part of splash_view;

// ignore: unused_element
class _EventMobile extends StatelessWidget {
  final EventViewModel viewModel;

  _EventMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('Welcome to Event Mobile '),
          // onLongPress: viewModel.NaviToView,
        ),
      ),
    );
  }
}
