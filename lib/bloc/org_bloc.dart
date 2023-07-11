import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:help_app/bloc/get_user_bloc.dart';
import 'package:help_app/model/OrgUser_model.dart';

part 'org_event.dart';
part 'org_state.dart';

class OrgBloc extends Bloc<OrgAdd, OrgState> {
  final CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("Org");
  OrgBloc() : super(OrgInitial()) {
    on<OrgAdd>((event, emit) async {
      bool mobileNumberMatched = false;
      emit(OrgLading());
      print(userCollection);
      var listData = userCollection.get();
      print("userLi9ist===${event.user}");

      await fetchDataFromFirestore().then(
        (QuerySnapshot<Map<String, dynamic>> snapshot) {
          // Handle the query snapshot here.
          if (snapshot.docs.isNotEmpty) {
            // Access the documents in the snapshot.
            for (var document in snapshot.docs) {
              // Access document data using document.data() as a Map<String, dynamic>.
              print('doc ${document.data()}');
              // print(pos.["state"]);
              // mappedData.add(document.data());
              // var pin = document.data();
              var documentData = document.data();
              if (documentData['mobile'] == event.user.mobile) {
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

          emit(OrgLoaded());
        } catch (e) {
          emit(
            OrgError(
              e.toString(),
            ),
          );
        }
      } else {
        print("user Available");
      }
    });
  }
}
