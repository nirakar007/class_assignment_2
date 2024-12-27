import 'package:flutter_bloc/flutter_bloc.dart';

class AreaRectangleCubit extends Cubit<double> {
  AreaRectangleCubit() : super(0);

  void calculateAreaRectangle(double length, double breadth) {
    emit(length * breadth);
  }
}
