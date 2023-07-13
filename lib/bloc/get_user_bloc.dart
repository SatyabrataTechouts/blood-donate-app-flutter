import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:help_app/bloc/get_user_state.dart';

part 'get_user_event.dart';

class GetUserBloc extends Bloc<GetData, GetUserState> {
  GetUserBloc() : super(GetUserInitial()) {
    on<GetData>(
      (event, emit) async {
        List<dynamic> data = [];
        List<dynamic> mappedData = [];

        emit(GetUserLoading());
        await Geolocator.checkPermission();
        await Geolocator.requestPermission();
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        List<Placemark>? pos = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        // print("location:${pos.state}");
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
                //pos[0].postalCode
                if (document.data()['pin'] == pos[0].postalCode) {
                  data.add(document.data());
                }
              }
            } else {
              print("No documents found.");
            }
          },
        );
        // for (int i = 0; i < mappedData.length; i++) {
        //   print(" mapped data ${mappedData[i]}");
        //   // if (data[i].state == pos.state) {}
        // }
        print(data);
        emit(GetUserLoaded(data));
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
