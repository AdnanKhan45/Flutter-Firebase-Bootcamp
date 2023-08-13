import 'package:flutter/material.dart';
import 'package:flutter_basics/lessons/week_2/19_bloc_section_2/cubit/firebase_crud/firebase_cruds_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../17_cloud_firestore_crud_basics/cloud_firestore_crud_basics_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud Firestore CRUD"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // BlocProvider.of<FirebaseCrudBloc>(context).add(
                //     CreateDataEvent(User(
                //       email: "john@gmail.com",
                //       username: "John Doe",
                //     )));

                BlocProvider.of<FirebaseCrudsCubit>(context).createData(User(
                  email: "john@gmail.com",
                  username: "John Doe",
                ));
              },
              child: Text("Create Data"),
            ),
          ),
          BlocBuilder<FirebaseCrudsCubit, FirebaseCrudsState>(
            builder: (context, state) {
              if(state is FirebaseCrudsLoading) {
                return Center(child: CircularProgressIndicator(),);
              }
              if(state is FirebaseCrudsFailure) {
                return Center(child: Text("Something went wrong"));
              }
              if(state is FirebaseCrudsLoaded) {
                final users = state.users;
                return users.isEmpty? Center(child: Text("No Data"),) : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: users.map((user) {
                      return ListTile(
                        leading: GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FirebaseBasicsBloc>(context).add(DeleteDataEvent(id: user.id!));
                              BlocProvider.of<FirebaseCrudsCubit>(context).deleteData(user.id!);
                            }
                            ,child: Icon(Icons.delete)),
                        trailing: GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FirebaseBasicsBloc>(context).add(UpdateDataEvent(user: User(
                              //     id: user.id,
                              //     email: "aaa@gmail.com",
                              //     username: "aaaa"
                              // )));
                              BlocProvider.of<FirebaseCrudsCubit>(context).updateData(User(
                                id: user.id,
                                email: "aaa@gmail.com",
                                username: "aaaa",
                              ));
                            },
                            child: Icon(Icons.update)),
                        title: Text(user.username!),
                        subtitle: Text(user.email!),
                      );
                    }).toList(),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator(),);
            },
          )
        ],
      ),
    );
  }
}