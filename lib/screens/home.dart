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
        return LayoutBuilder(
          builder: (context, constraints) {
            double height = constraints.maxHeight;
            return Scaffold(
              backgroundColor: Color(0xffff),
              body: Column(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      height: height,
                      child: state.data.isEmpty
                          ? const Center(
                              child: Text(
                                "No Donar is available for this area",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemBuilder: (context, index) {
                                return CardComponent(
                                  state.data[index]['bloodGroup'],
                                  name: state.data[index]['name'],
                                  mobile: state.data[index]['mobile'],
                                );
                              },
                              itemCount: state.data.length,
                            ),
                    ),
                  )
                ],
              ),
            );
          },
        );
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
