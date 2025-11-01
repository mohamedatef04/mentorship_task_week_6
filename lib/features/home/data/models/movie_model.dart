import 'package:movies_app/core/constants/api_constants.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int? budget;
  final List<dynamic>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<dynamic>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<dynamic>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  }) : super(
         movieId: id ?? 0,
         movieImg: posterPath != null
             ? '${ApiConstants.imagePath}$posterPath'
             : '${ApiConstants.imagePath}/7JzOmJ1fIU43I3gLHYsY8UzNzjG.jpg',
         movieName: title ?? '',
         movieReleaseDate: releaseDate ?? '',
         movieVoteAverage: voteAverage ?? 0.0,
         movieVoteCount: voteCount ?? 0,
       );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    adult: json['adult'],
    backdropPath: json['backdrop_path'],
    belongsToCollection: json['belongs_to_collection'],
    budget: json['budget'],
    genres: json['genres'],
    homepage: json['homepage'],
    id: json['id'],
    imdbId: json['imdb_id'],
    originCountry: List<String>.from(json['origin_country'] ?? []),
    originalLanguage: json['original_language'],
    originalTitle: json['original_title'],
    overview: json['overview'],
    popularity: json['popularity']?.toDouble(),
    posterPath: json['poster_path'],
    productionCompanies: List<ProductionCompany>.from(
      (json['production_companies'] ?? []).map(
        (x) => ProductionCompany.fromJson(x),
      ),
    ),
    productionCountries: json['production_countries'],
    releaseDate: json['release_date'],
    revenue: json['revenue'],
    runtime: json['runtime'],
    spokenLanguages: json['spoken_languages'],
    status: json['status'],
    tagline: json['tagline'],
    title: json['title'],
    video: json['video'],
    voteAverage: json['vote_average']?.toDouble(),
    voteCount: json['vote_count'],
  );

  Map<String, dynamic> toJson() => {
    'adult': adult,
    'backdrop_path': backdropPath,
    'belongs_to_collection': belongsToCollection,
    'budget': budget,
    'genres': genres,
    'homepage': homepage,
    'id': id,
    'imdb_id': imdbId,
    'origin_country': originCountry,
    'original_language': originalLanguage,
    'original_title': originalTitle,
    'overview': overview,
    'popularity': popularity,
    'poster_path': posterPath,
    'production_companies': productionCompanies
        ?.map((x) => x.toJson())
        .toList(),
    'production_countries': productionCountries,
    'release_date': releaseDate,
    'revenue': revenue,
    'runtime': runtime,
    'spoken_languages': spokenLanguages,
    'status': status,
    'tagline': tagline,
    'title': title,
    'video': video,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}

class ProductionCompany {
  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json['id'],
        logoPath: json['logo_path'],
        name: json['name'],
        originCountry: json['origin_country'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'logo_path': logoPath,
    'name': name,
    'origin_country': originCountry,
  };
}
