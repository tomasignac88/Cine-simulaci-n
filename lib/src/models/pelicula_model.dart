class Peliculas{//Contenedor de todas las peliculas

  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList( List<dynamic> jsonList ){
    
    if( jsonList == null) return;

    for (var item in jsonList) { //recorro el mapeo
      final pelicula = new Pelicula.fromJsonMap(item);//creo la pelicula
      items.add(pelicula);
    }
  }
}


class Pelicula {
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });
  //Asignamos a cada atributo su valor
  Pelicula.fromJsonMap( Map<String, dynamic> json ){
    voteCount   = json['vote_count'];
    id          = json['id'];
    title       = json['title'];
    genreIds    = json['genre_ids'].cast<int>();
    video       = json['video'];
    posterPath  = json['poster_path'];
  }


  getPosterImg(){

    if(posterPath == null){
      return 'https://image.shutterstock.com/image-illustration/not-working-red-rubber-stamp-260nw-576995737.jpg';
    }else{
      return 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/$posterPath';
    }
  }
}
