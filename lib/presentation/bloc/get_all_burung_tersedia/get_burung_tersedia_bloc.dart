import 'package:bloc/bloc.dart';
import 'package:canary_project/data/repository/get_all_burung_tersedia_repository.dart';
import 'package:canary_project/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_event.dart';
import 'package:canary_project/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_state.dart';

class GetBurungTersediaBloc
    extends Bloc<GetBurungTersediaEvent, GetBurungTersediaState> {
  final GetAllBurungTersediaRepository getAllBurungTersediaRepository;

  GetBurungTersediaBloc(this.getAllBurungTersediaRepository)
      : super(GetBurungTersediaInitial()) {
    on<GetAllBurungTersediaEvent>(_getAllBurungTersedia);
  }

  Future<void> _getAllBurungTersedia(
    GetAllBurungTersediaEvent event,
    Emitter<GetBurungTersediaState> emit,
  ) async {
    emit(GetBurungTersediaLoading());
    final result = await getAllBurungTersediaRepository.GetAllBurungTersedia();
    result.fold(
      (error) => emit(GetBurungTersediaError(message: error)),
      (burungTersedia) =>
          emit(GetBurungTersediaLoaded(burungTersedia: burungTersedia)),
    );
  }
}
