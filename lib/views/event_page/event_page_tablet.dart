part of event_page_view;

class _EventPageTablet extends StatelessWidget {
  final EventPageViewModel viewModel;

  _EventPageTablet (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('EventPageTablet'),
      ),
    );
  }
}
