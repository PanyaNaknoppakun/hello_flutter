import 'package:flutter/material.dart';

import 'detail_page_view.dart';

class ComponentView {
  ComponentView._();

  static Widget buildSearchView(
      List<String> filterList, Function(String) filterListCallback) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onChanged: (value) {
            filterListCallback(value); // Call the callback to filter the list
          },
          hintText: 'Search...',
          leading: const Icon(Icons.search),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<Widget>.generate(filterList.length, (index) {
          return ListTile(
            leading: const Icon(Icons.star),
            title: Text(filterList[index]),
            subtitle: Text("Sub index: $index"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const DetailView();
                },
              ));
            },
          );
        });
      },
    );
  }

  static Widget buildListView(List<String> filterList) {
    return ListView.builder(
      itemCount: filterList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.star),
          title: Text(filterList[index]),
          subtitle: Text("sssssss"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const DetailView();
              },
            ));
          },
        );
      },
    );
  }

  static Widget buildBottomNavigationBar(Function() onPressed) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      color: Colors.cyan.shade400,
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: IconButton(
                icon: const Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                onPressed: () {
                  onPressed();
                },
              )),
          const SizedBox(width: 50.0),
          // Add an empty space of 16.0 logical pixels (adjust the value as needed)
          Expanded(
              child: IconButton(
                icon: const Icon(
                  Icons.map,
                  color: Colors.black,
                ),
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}
