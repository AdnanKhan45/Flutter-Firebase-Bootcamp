part of 'firebase_crud_bloc.dart';

abstract class FirebaseCrudState extends Equatable {
  const FirebaseCrudState();
}

class FirebaseCrudInitial extends FirebaseCrudState {
  @override
  List<Object> get props => [];
}

class FirebaseCrudLoading extends FirebaseCrudState {
  @override
  List<Object> get props => [];
}

class FirebaseCrudLoaded extends FirebaseCrudState {
  final List<User> users;

  FirebaseCrudLoaded(this.users);
  @override
  List<Object> get props => [users];
}

class FirebaseCrudFailure extends FirebaseCrudState {
  @override
  List<Object> get props => [];
}

