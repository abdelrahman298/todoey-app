import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoey_app/layout/cubit/todoey_cubit.dart';
import 'package:todoey_app/layout/cubit/todoey_state.dart';
import 'package:todoey_app/shared/styles/colors.dart';

class TodoeyLayout extends StatelessWidget {
  const TodoeyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodeoyCubit, TodoeyStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(right: 1.0,bottom: 8.0),
            height: 65.0,
            width: 65.0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: HexColor('#344FA1').withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: FloatingActionButton(
                elevation: 10.0,

                backgroundColor: HexColor('#3486A1'),
                onPressed: () {},
                child:  const Icon(Icons.add),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 30),
                const Text(
                  'What\'s up, userName!',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // const Text(
                //   'back!',
                //   style: TextStyle(
                //     fontSize: 28.0,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  color: defaultColor,
                  height: 5,
                  width: 30,
                ),
                const SizedBox(height: 30),
                const Text(
                  'CATEGORIES',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.builder(
                    primary: false,
                    // padding: const EdgeInsets.all(20),
                    itemBuilder: (BuildContext context, int index)=>buildItemCategory(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount:2,
                  ),
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}


Widget buildItemCategory()=>MaterialButton(
  onPressed: (){},
padding:const EdgeInsets.all(12) ,
  color: defaultColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  child:   Column(
    // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      Icon(Icons.list_alt_outlined,
          color: Colors.blue.withOpacity(0.7)),
      const SizedBox(height: 25),
      const Text(
        'All',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        '12 tasks',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white.withOpacity(0.6),
        ),
      )
    ],
  ),
);


// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
// crossAxisCount: 2,