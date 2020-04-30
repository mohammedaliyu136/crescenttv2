import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {



  @override
  NewsState get initialState => InitialNewsState();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    // TODO: Add your event logic
  }
}
