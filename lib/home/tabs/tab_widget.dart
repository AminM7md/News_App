import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/home/news/news_widget.dart';
import 'package:news_app/home/tabs/tab_item.dart';
import 'package:news_app/model/SourceResponse.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourcesList;

  TabWidget({required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
          child: Column(
            children: [
              TabBar(
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  onTap: (index){
                    selectedIndex = index;
                    setState(() {

                    });
                  },
                  tabs: widget.sourcesList.map((source) => TabItem(
                      isSelectedItem: selectedIndex == widget.sourcesList.indexOf(source),
                      source: source
                  )
                  ).toList()
              ),
              Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
            ],
          )
    );
  }
}
