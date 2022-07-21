import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

const debounceDuration = Duration(milliseconds: 50);

EventTransformer<E> debounceEvent<E>(Duration duration) {
  return (events, mapper) {
    return events.debounceTime(duration).asyncExpand(mapper);
  };
}
