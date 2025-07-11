import 'package:bloc/bloc.dart';
import 'package:canary_project/data/repository/profile_buyer_repository.dart';
import 'package:canary_project/presentation/buyer/profile/bloc/profile_buyer_event.dart';
import 'package:canary_project/presentation/buyer/profile/bloc/profile_buyer_state.dart';

class ProfileBuyerBloc extends Bloc<ProfileBuyerEvent, ProfileBuyerState> {
  final ProfileBuyerRepository profileBuyerRepository;
  ProfileBuyerBloc({required this.profileBuyerRepository}):super(ProfileBuyerInitial()){
    on<AddProfileBuyerEvent>(_addProfileBuyer);
    on<GetProfileBuyerEvent>(_getProfileBuyer);
  }

  Future<void> _addProfileBuyer(
    AddProfileBuyerEvent event,
    Emitter<ProfileBuyerState> emit,
  ) async {
    emit(ProfileBuyerLoading());
    final result = await profileBuyerRepository.addProfileBuyer(
      event.requestModel,
    );
    result.fold((error) => emit(ProfileBuyerAddError(message: error)), (
      profile,
    ) {
      emit(ProfileBuyerAdded(profile: profile));
    });
  }

  Future<void>_getProfileBuyer(
    GetProfileBuyerEvent event,
    Emitter<ProfileBuyerState> emit,
  )async {
    emit(ProfileBuyerLoading());
    final result = await profileBuyerRepository.getProfileBuyer();
    result.fold(
      (error) => emit(ProfileBuyerError(message: error)),
      (profile) => emit(ProfileBuyerLoaded(profile: profile)),
    );
  }
}