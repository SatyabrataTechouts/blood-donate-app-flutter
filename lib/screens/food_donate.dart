import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_app/bloc/get_org_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class FoodDonate extends StatefulWidget {
  @override
  State<FoodDonate> createState() => _FoodDonateState();
}

const style = TextStyle(
  color: Colors.white,
  fontSize: 17,
  fontWeight: FontWeight.w500,
);

class _FoodDonateState extends State<FoodDonate> {
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchData(context);
    });
  }

  void fetchData(BuildContext context) {
    BlocProvider.of<GetOrgBloc>(context).add(GetOrgData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrgBloc, GetOrgState>(
      builder: (context, state) {
        if (state is GetOrgLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetOrgLoaded) {
          print(state.data);
          return Scaffold(
              body: ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.orangeAccent,
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.blueGrey,
                        blurRadius: 4, // soften the shadow
                        spreadRadius: 0.32, //extend the shadow
                        offset: Offset(
                          2.0, // Move to right 2  horizontally
                          2.0, // Move to bottom 2 Vertically
                        ),
                      )
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Organisation Name:${state.data[index]['name']}',
                              style: style,
                            ),
                            Text(
                              "Mobile Number:${state.data[index]['mobile']} ",
                              style: style,
                            ),
                          ],
                        ),
                        IconButton(
                          // ignore: deprecated_member_use
                          onPressed: () => launch(
                            "tel://",
                          ),
                          icon: const Icon(
                            Icons.call,
                            color: Colors.white,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
        } else {
          return Center(
            child: Text('Data not avialable'),
          );
        }
      },
    );
  }
}
