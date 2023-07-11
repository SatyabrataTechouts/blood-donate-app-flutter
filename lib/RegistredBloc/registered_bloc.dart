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
        bool mobileNumberMatched = false;
        emit(RegisteredLoading());
        print(userCollection);
        var listData = userCollection.get();
        print("userLi9ist===$listData");
        await fetchDataFromFirestore().then(
          (QuerySnapshot<Map<String, dynamic>> snapshot) {
            // Handle the query snapshot here.
            if (snapshot.docs.isNotEmpty) {
              // Access the documents in the snapshot.
              for (var document in snapshot.docs) {
                // Access document data using document.data() as a Map<String, dynamic>.
                print(document.data());
                // print(pos.["state"]);
                // mappedData.add(document.data());
                // var pin = document.data();
                var documentData = document.data();
                if (documentData['mobile'] == event.user.mobileNumber) {
                  mobileNumberMatched = true;
                  break;
                }
              }
            } else {
              print("No documents found.");
            }
          },
        );
        if (!mobileNumberMatched) {
          try {
            await userCollection.add(
              event.user.toJson(),
            );

            emit(
              RegistredSuccess(),
            );
          } catch (e) {
            emit(
              RegistredError(
                e.toString(),
              ),
            );
          }
        } else {
          print(
            "user Available",
          );
        }
      },
    );
  }
}

Future<QuerySnapshot<Map<String, dynamic>>> fetchDataFromFirestore() {
  // Assuming you have initialized Firebase and obtained a Firestore instance.
  final firestore = FirebaseFirestore.instance;

  // Query the 'collectionName' collection.
  final collectionRef = firestore.collection('User');

  // Perform the query and return the future.
  return collectionRef.get();
}
