part of 'firebase_cruds_cubit.dart';

abstract class FirebaseCrudsState extends Equatable {
  const FirebaseCrudsState();
}

class FirebaseCrudsInitial extends FirebaseCrudsState {
  @override
  List<Object> get props => [];
}


class FirebaseCrudsLoading extends FirebaseCrudsState {
  @override
  List<Object> get props => [];
}



class FirebaseCrudsLoaded extends FirebaseCrudsState {
  final List<User> users;

  FirebaseCrudsLoaded(this.users);
  @override
  List<Object> get props => [users];
}



class FirebaseCrudsFailure extends FirebaseCrudsState {
  @override
  List<Object> get props => [];
}

