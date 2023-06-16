

import 'package:auto_route/auto_route.dart';
import 'package:demo_movies/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../common/widget/common_widget.dart';
import '../../domain/entities/movie_entity.dart';
import '../../framework/locator/inject_container.dart';
import '../../framework/router/app_router.dart';
import 'bloc/movie_list_bloc.dart';
import 'bloc/movie_list_event.dart';
import 'bloc/movie_list_state.dart';

class MovieListPage extends StatefulWidget {

  late MovieListBloc _movieListBloc;

  MovieListPage({super.key, required this.selectedIndex}) {
    _movieListBloc = locator<MovieListBloc>();
  }

  final int selectedIndex;

  @override
  State<MovieListPage> createState() => _MovieListState();
}

class _MovieListState extends State<MovieListPage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieListBloc, MovieListState>(
      bloc: widget._movieListBloc..add(MovieListPageInitiated(widget.selectedIndex)),
      listenWhen: (previous, current) => (previous.errorMessage != current.errorMessage) && current.errorMessage.isNotEmpty,
      listener: (BuildContext context, MovieListState state) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.errorMessage)
            )
        );
      },
      builder: (BuildContext context, MovieListState state) {
        return Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  AppConstants.TITLE_LIST[widget.selectedIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            (widget.selectedIndex == AppConstants.SEARCH_MOVIES_INDEX)? _buildSearchForm(state) : emptyWidget(),
            Expanded(
                child: Stack(
                  children: <Widget>[
                    _buildMovieListView(context, state.movies),
                    buildLoadingIndicator(state.isLoading)
                  ],
                )
            )
          ],
        );
      },
    );
  }

  Widget _buildSearchForm(MovieListState state) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      width: double.infinity,
                      child: TextFormField(
                        controller: _keywordController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "search movie by title"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the keyword';
                          }
                          return null;
                        },
                      ),
                    )
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          widget._movieListBloc.add(SearchMovies(_keywordController.value.text));
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                )
              ],
            ),
            (state.keyword.isNotEmpty)?
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text("Showing result for keyword: ${state.keyword}"),
            ) : emptyWidget(),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMovieListView(BuildContext context, List<MovieEntity> movies) {
    return LazyLoadScrollView(
        onEndOfPage: () {
          widget._movieListBloc.add(const MovieListPageLoadMoreData());
        },
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, index) {
              final movie = movies[index];

              return ListTile(
                title: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        width: 110,
                        height: 110,
                        child: movie.imageUrl.isNotEmpty ? Image.network(
                          movie.imageUrl,
                          width: 100,
                          height: 100,
                        ) : emptyWidget(),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 10, right: 10),
                              child: Text(
                                movie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                                child: Text(
                                  movie.overview,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                )
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  if (widget.selectedIndex == AppConstants.WATCHLIST_MOVIES_INDEX) {
                    context.router.push(MovieDetailsRoute(movieId: movie.id)).then((value) {
                      widget._movieListBloc.add(const ReloadWatchlistMovies());
                    });
                  } else {
                    context.router.push(MovieDetailsRoute(movieId: movie.id));
                  }
                },
              );
            }
        )
    );
  }
}
