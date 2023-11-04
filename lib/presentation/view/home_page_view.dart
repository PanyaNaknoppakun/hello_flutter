import 'package:flutter/material.dart';
import 'package:hello_flutter/presentation/view/component_view.dart';
import 'package:hello_flutter/presentation/viewmodel/home_view_model.dart';

import 'detail_page_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements HomeViewModelDelegate {
  final HomeViewModel _homeViewModel = HomeViewModel();
  bool isDark = false;

  @override
  void initState() {
    _homeViewModel.delegate = this;
    _homeViewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ComponentView.buildSearchView(_homeViewModel.getFilterList(),
              (value) {
            _homeViewModel.filterList(value);
          }),
        ),
        Expanded(
          child: _homeViewModel.getFilterList().isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text("Data not loaded yet."))
              : ComponentView.buildListView(_homeViewModel.getFilterList()),
        ),
      ]),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const DetailView();
            },
          ));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ComponentView.buildBottomNavigationBar(() => {
        _homeViewModel.fetchData()
      }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
