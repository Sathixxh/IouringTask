import 'package:equatable/equatable.dart';
import 'package:iouringtask/Features/WatchListMain/Data/model/watchlistmodel.dart';

abstract class WatchlistEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadWatchlist extends WatchlistEvent {}

class UpdateWatchListEvent extends WatchlistEvent {
  final List<WatchListModel> updatedWatchList;

  UpdateWatchListEvent(this.updatedWatchList);

  @override
  List<Object> get props => [updatedWatchList];
}
