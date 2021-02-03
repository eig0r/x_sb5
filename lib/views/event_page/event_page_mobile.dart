part of event_page_view;

class _EventPageMobile extends StatelessWidget {
  final EventPageViewModel viewModel;

  _EventPageMobile (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('EventPageMobile'),
      ),
    );
  }
}
