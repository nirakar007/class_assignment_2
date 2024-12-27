import 'package:class_assignment_2/cubit/area_circle_cubit.dart';
import 'package:class_assignment_2/cubit/area_rectangle_cubit.dart';
import 'package:class_assignment_2/cubit/dashboard_cubit.dart';
import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_2/view/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        // the dashboard needs to create Cubits for the components and also make one for itself
        providers: [
          BlocProvider(create: (context) => AreaCircleCubit()),
          BlocProvider(create: (context) => AreaRectangleCubit()),
          BlocProvider(create: (context) => SimpleInterestCubit()),
          BlocProvider(
              create: (context) => DashboardCubit(
                    context.read<AreaCircleCubit>(),
                    context.read<AreaRectangleCubit>(),
                    context.read<SimpleInterestCubit>(),
                  )),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter BLoC',
          home: DashboardView(),
        ));
  }
}
