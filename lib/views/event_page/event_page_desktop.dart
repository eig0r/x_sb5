part of event_page_view;

class _EventPageDesktop extends StatelessWidget {
  final EventPageViewModel viewModel;
  
  _EventPageDesktop (this.viewModel);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('EventPageDesktop'),
      ),
    );
  }
}
