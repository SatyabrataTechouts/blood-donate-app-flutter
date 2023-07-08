import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_app/bloc/get_user_bloc.dart';
import 'package:help_app/bloc/get_user_state.dart';
import 'package:help_app/screens/components/card_components.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchData(context);
    });
  }

  void fetchData(BuildContext context) {
    BlocProvider.of<GetUserBloc>(context).add(GetData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
      if (state is GetUserLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      } else if (state is GetUserLoaded) {
        return LayoutBuilder(builder: (context, constraints) {
          double height = constraints.maxHeight;
          return Scaffold(
            body: Column(
              children: [
                // Container(
                //   alignment: Alignment.center,
                //   child: Image.network(
                //     "https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg",
                //     width: double.infinity,
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.symmetric(
                //     horizontal: 5,
                //   ),
                //   child: const Text(
                //     "सत्यमेव जयते",
                //     style: TextStyle(
                //       fontSize: 17,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: height,
                    child: state.data.isEmpty
                        ? Center(
                            child: Text("No Donare is available for this area"),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) {
                              return Container(
                                child: CardComponent(
                                  state.data[index]['bloodGroup'],
                                  name: state.data[index]['name'],
                                  mobile: state.data[index]['mobile'],
                                ),
                              );
                            },
                            itemCount: state.data.length,
                          ),
                  ),
                )
              ],
            ),
          );
        });
      } else {
        return const Scaffold(
          body: Center(
            child: Text("Error"),
          ),
        );
      }
    });
  }
}
