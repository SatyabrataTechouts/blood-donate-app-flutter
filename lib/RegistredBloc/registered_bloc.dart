import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:help_app/RegistredBloc/registered_event.dart';

part 'registered_state.dart';

class RegisteredBloc extends Bloc<AddUserEvent, RegisteredState> {
  final CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("User");

  RegisteredBloc() : super(RegisteredInitial()) {
    on<AddUserEvent>(
      (event, emit) async {
        emit(RegisteredLoading());
        print(userCollection);
        var listData = userCollection.get();
        print(listData);
        try {
          await userCollection.add(event.user.toJson());

          emit(RegistredSuccess());
        } catch (e) {
          emit(
            RegistredError(
              e.toString(),
            ),
          );
        }
        // } else {
        //   try {
        //     await userCollection.doc("blood").update(event.user.toJson());
        //     var x = userCollection.get();
        //     // print("fgdjfdghfghfkdgf$x");
        //     emit(RegistredSuccess());
        //   } catch (e) {
        //     emit(
        //       RegistredError(
        //         e.toString(),
        //       ),
        //     );
        //   }
        // }
      },
    );
  }
}
