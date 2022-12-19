import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo/bean/workout_bean.dart';

class WorkoutCubit extends Cubit<List<WorkoutBean>> {
  WorkoutCubit() : super([]);

  getWorkouts() async {
    final List<WorkoutBean> workouts = [];
    final workoutsJson =
    jsonDecode(await rootBundle.loadString("assets/images/workouts.json"));
    for (var el in (workoutsJson as Iterable)) {
      print("workoutsJson forEach");
      workouts.add(WorkoutBean.fromJson(el));
    }
    workouts.forEach((element) {
      print(element.toJson());
    });
    emit(workouts);
  }

}
