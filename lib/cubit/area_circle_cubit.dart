import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCircleCubit extends Cubit<double> {
  AreaCircleCubit() : super(0);

  void calculateAreaCircle(radius) {
    emit(3.14 * radius * radius);
  }
}
