
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_config.dart';
import '../../common/widget/common_widget.dart';
import '../../framework/locator/inject_container.dart';
import 'bloc/movie_details_bloc.dart';
import 'bloc/movie_details_event.dart';
import 'bloc/movie_details_state.dart';

@RoutePage()
class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
      ),
      body: BlocProvider<MovieDetailsBloc>(
        create: (BuildContext context) => locator<MovieDetailsBloc>()..add(MovieDetailsPageInitiated(movieId)),
        child: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
          listenWhen: (previous, current) => previous.errorMessage != current.errorMessage && current.errorMessage.isNotEmpty,
          listener: (BuildContext context, MovieDetailsState state) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.errorMessage)
                )
            );
          },
          builder: (BuildContext context, MovieDetailsState state) {
            return Stack(
              children: <Widget>[
                _buildMainView(context, state),
                buildLoadingIndicator(state.isLoading)
              ],
            );
          },
        ),
      )
    );
  }

  Widget _buildMainView(BuildContext context, MovieDetailsState state) {
    return SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  state.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: state.imageUrl.isNotEmpty ? Image.network(
                  state.imageUrl,
                  width: 200,
                  height: 200,
                ) : emptyWidget(),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
                child: Text(state.description),
              ),
              (state.isLoading)?
                emptyWidget()
              :
                (state.isInWatchlistMovies)? _buildRemoveFromWatchlistMoviesWidget(context, movieId) : _buildAddToWatchlistMoviesWidget(context, movieId)
            ],
          ),
        )
    );
  }

  Widget _buildAddToWatchlistMoviesWidget(BuildContext context, int movieId) {
    return TextButton(
      child: const Text("Add to Watchlist"),
      onPressed: () {
        context.read<MovieDetailsBloc>().add(const AddToWatchlistMovies());
      },
    );
  }

  Widget _buildRemoveFromWatchlistMoviesWidget(BuildContext context, int movieId) {
    return TextButton(
      child: const Text("Remove from Watchlist"),
      onPressed: () {
        context.read<MovieDetailsBloc>().add(const RemoveFromWatchlistMovies());
      },
    );
  }
}
