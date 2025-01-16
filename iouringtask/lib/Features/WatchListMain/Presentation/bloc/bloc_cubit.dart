import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iouringtask/Features/WatchListMain/Domain/UseCase/watchlistusecase.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bloc_screen.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bloc_state.dart';


class WatchListBloc extends Bloc<WatchlistEvent, WatchListState> {
  final WatchListUseCase watchListUseCase;
  WatchListBloc({required this.watchListUseCase})
      : super(WatchListLoadingState()) {
    on<LoadWatchlist>(
      (event, emit) async {
        emit(WatchListLoadingState());
        try {
          print("etered");
          final watchListDetails = await watchListUseCase.getdata();
          print(watchListDetails);
          emit(WatchListSuccessState(watchListDetails: watchListDetails));
        } catch (e) {
          print(e.toString());
          emit(const WatchListFailureState(message: "ApiFailed"));
        }
      },
    );
  }
  @override
  void onChange(Change<WatchListState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change.currentState.toString());
  }
}