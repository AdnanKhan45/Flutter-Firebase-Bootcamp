import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_basics/lessons/week_2/17_cloud_firestore_crud_basics/cloud_firestore_crud_basics_widget.dart';
import 'package:flutter_basics/lessons/week_2/19_bloc_section_2/database/database_handler.dart';

part 'firebase_cruds_state.dart';

class FirebaseCrudsCubit extends Cubit<FirebaseCrudsState> {
  FirebaseCrudsCubit() : super(FirebaseCrudsInitial());

  void readData() {
    try {
      emit(FirebaseCrudsLoading());
      final streamResponse = DatabaseHandler.readData();
      streamResponse.listen((users) {
        emit(FirebaseCrudsLoaded(users));
      });
    } catch(e) {
      emit(FirebaseCrudsFailure());
    }
  }

  void createData(User user) {
    if(state is FirebaseCrudsLoaded) {
      DatabaseHandler.createData(user);
    }
  }

  void updateData(User user) {
    if(state is FirebaseCrudsLoaded) {
      DatabaseHandler.updateData(user);
    }
  }

  void deleteData(String id) {
    if(state is FirebaseCrudsLoaded) {
      DatabaseHandler.deleteData(id);
    }
  }
}
