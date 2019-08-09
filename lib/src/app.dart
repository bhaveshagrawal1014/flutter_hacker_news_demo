import 'package:flutter/material.dart';
import 'screens/news_list_screen.dart';
import 'blocks/stories_provider.dart';
import 'screens/news_detail_screen.dart';
import 'blocks/comments_provider.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'News',
          onGenerateRoute: (RouteSettings settings) {
            return routes(settings);
          },
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {

    if(settings.name == '/') {
      return MaterialPageRoute(
          builder: (context) {
            final bloc = StoriesProvider.of(context);
            bloc.fetchTopIds();
            return NewsListScreen();
          }
      );
    }
    else {
      return MaterialPageRoute(
          builder: (context) {
            final itemId = int.parse(settings.name.replaceFirst("/", ""));
            final commentsBloc = CommentsProvider.of(context);

            commentsBloc.fetchItemWithComments(itemId);

            return NewsDetailScreen(
                itemId: itemId
            );
          }
      );
    }

  }
}