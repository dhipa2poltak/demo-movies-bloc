

import 'package:demo_movies/data/constants.dart';
import 'package:demo_movies/data/models/add_remove_watchlist_movie.dart';
import 'package:demo_movies/data/models/responses/movie_response.dart';
import 'package:demo_movies/data/models/responses/watchlist_movies_response.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../app_config.dart';
import '../../../data/models/responses/movie_details_response.dart';
import '../../locator/inject_container.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @factoryMethod
  static ApiClient create() {
    final dio = locator<Dio>();

    return ApiClient(dio, baseUrl: AppConfig.baseUrl);
  }

  @GET('3/movie/now_playing')
  Future<MovieResponse> getNowPlayingMovies({
    @Query("page") required int page,
    @Query("language") @Default('en-US') String language = 'en-US'
  });

  @GET("3/movie/top_rated")
  Future<MovieResponse> getTopRatedMovies({
    @Query("page") required int page,
    @Query("language") @Default('en-US') String language = 'en-US'
  });

  @GET("3/movie/upcoming")
  Future<MovieResponse> getUpcomingMovies({
    @Query("page") required int page,
    @Query("language") @Default('en-US') String language= 'en-US'
  });

  @GET("3/movie/popular")
  Future<MovieResponse> getPopularMovies({
    @Query("page") required int page,
    @Query("language") @Default('en-US') String language = 'en-US'
  });

  @GET("3/search/movie")
  Future<MovieResponse> searchMovies({
    @Query("query") required String query,
    @Query("page") required int page,
    @Query("language") @Default('en-US') String language = 'en-US'
  });

  @GET("3/movie/{movie_id}")
  Future<MovieDetailsResponse> getMovieDetail(
    @Path("movie_id") int movieId
  );

  @GET("3/account/{account_id}/watchlist/movies")
  Future<MovieResponse> getWatchlistMovies({
    @Query("page") required int page,
    @Query("language") @Default('en-US') String language = 'en-US',
    @Query("sort_by") @Default('created_at.asc') String sortBy = 'created_at.asc',
    @Path("account_id") @Default(Constants.ACCOUNT_ID) String accountId = Constants.ACCOUNT_ID
  });

  @GET("3/movie/{movie_id}/account_states")
  Future<WatchlistMoviesResponse> isInWatchlistMovies(
    @Path("movie_id") int movieId,
  );

  @POST("3/account/{account_id}/watchlist")
  Future<void> addRemoveWatchlistMovie({
    @Body() required AddRemoveWatchlistMovie body,
    @Path("account_id") @Default(Constants.ACCOUNT_ID) String accountId = Constants.ACCOUNT_ID
  });
}
