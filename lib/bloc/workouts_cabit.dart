import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo/bean/exercise_bean.dart';
import 'package:photo/bean/workout_bean.dart';

class WorkoutsCubit extends Cubit<List<WorkoutBean>> {
  WorkoutsCubit() : super([]);

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

  saveWorkout(WorkoutBean workout, int index) {
    WorkoutBean newWork = WorkoutBean(title: workout.title, exercises: []);
    int exIndex = 0;
    int startTime = 0;
    for (var ex in workout.exercises!) {
      newWork.exercises!.add(ExerciseBean(
          title: ex.title,
          startTime: ex.startTime,
          duration: ex.duration,
          index: ex.index));
      exIndex++;
      startTime += ex.prelude! + ex.duration!;
    }
    state[index] = newWork;
    emit([...state]);
  }
}
