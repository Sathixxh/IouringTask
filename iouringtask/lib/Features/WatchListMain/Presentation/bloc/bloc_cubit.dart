import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iouringtask/Features/WatchListMain/Domain/UseCase/watchlistusecase.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bloc_screen.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bloc_state.dart';


class WatchListBloc extends Bloc<WatchlistEvent, WatchListState> {
  final WatchListUseCase watchListUseCase;

  WatchListBloc({required this.watchListUseCase}) : super(WatchListLoadingState()) {
    // Handle LoadWatchlist event
    on<LoadWatchlist>(
      (event, emit) async {
        emit(WatchListLoadingState());
        try {
          final watchListDetails = await watchListUseCase.getdata();
          emit(WatchListSuccessState(watchListDetails: watchListDetails));
        } catch (e) {
          emit(const WatchListFailureState(message: "Error "));
        }
      },
    );

    // Handle UpdateWatchListEvent (after reordering)
    on<UpdateWatchListEvent>(
      (event, emit) {
        emit(WatchListSuccessState(watchListDetails: event.updatedWatchList));
      },
    );
  }

  @override
  void onChange(Change<WatchListState> change) {
    super.onChange(change);
    // print("Watchlist::${change.currentState.toString()}");
  }
}
