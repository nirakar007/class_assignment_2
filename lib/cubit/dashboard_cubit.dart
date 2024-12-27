import 'package:class_assignment_2/cubit/area_circle_cubit.dart';
import 'package:class_assignment_2/cubit/area_rectangle_cubit.dart';
import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:class_assignment_2/view/area_circle_view.dart';
import 'package:class_assignment_2/view/area_rectangle_view.dart';
import 'package:class_assignment_2/view/simple_interest_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._areaCircleCubit,
    this._areaRectangleCubit,
    this._simpleInterestCubit,
  ) : super(null);

  final AreaCircleCubit _areaCircleCubit;
  final AreaRectangleCubit _areaRectangleCubit;
  final SimpleInterestCubit _simpleInterestCubit;

  void openCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaCircleCubit,
          child: AreaCircleView(),
        ),
      ),
    );
  }

  void openRectangleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaRectangleCubit,
          child: AreaRectangleView(),
        ),
      ),
    );
  }

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: SimpleInterestView(),
        ),
      ),
    );
  }
}
