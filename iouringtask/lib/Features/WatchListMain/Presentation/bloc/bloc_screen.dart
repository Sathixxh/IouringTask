import 'package:equatable/equatable.dart';

abstract class WatchlistEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadWatchlist extends WatchlistEvent {}