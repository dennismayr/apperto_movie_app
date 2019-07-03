// Model of API results interpretation

// Adding private variables as placeholders for JSON key results
class ItemModel {
  int _page;
  int _total_pages;
  int _total_results;
  List<_Result> _results = [];

  // API returns response as JSON, we need to chew on it, key by key. There are several keys:
  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];

    // Now we're going to process 'results' index
    List<_Result> temp = [];

    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  // We'll assign these 1st-level keys to a private variable for processing
  List<_Result> get results => _results;
  int get total_pages => _total_pages;
  int get total_results => _total_results;
  int get page => _page;
}

// Now we're going for the 'results' sub-keys by [i] index, as returned by the API
class _Result {
  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_title;

  List<int> _genre_ids =
      []; // this key has sub-keys with indexes to be treated as an array

  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;

  _Result(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];

    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]); // we're iterating through 'genre_ids' indexes
    }

    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  String get release_date => _release_date;
  String get overview => _overview;
  bool get adult => _adult;
  String get _backdrop_path => _backdrop_path;

  List<int> get genre_ids => _genre_ids;

  String get original_title => _original_title;
  String get original_language => _original_language;
  String get poster_path => _poster_path;
  double get popularity => _popularity;
  String get title => _title;
  double get vote_average => _vote_average;
  bool get video => _video;
  int get id => _id;
  int get vote_count => _vote_count;
}
