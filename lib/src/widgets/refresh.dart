import 'package:flutter/material.dart';
import '../blocks/stories_provider.dart';

class Refresh extends StatelessWidget {

  ListView child;

  Refresh({this.child});

  Widget build(BuildContext context) {

    final bloc = StoriesProvider.of(context);
    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchTopIds();
      },
    );
  }
}