import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:photo/bean/exercise_bean.dart';

class WorkoutBean extends Equatable {
  WorkoutBean({this.title, this.exercises});

  String? title;
  List<ExerciseBean>? exercises;

  factory WorkoutBean.fromJson(Map<String, dynamic> json) {
    List<ExerciseBean> exercises = [];
    int index = 0;
    int startTime = 0;
    for (var ex in (json["exercises"] as Iterable)) {
      exercises.add(ExerciseBean.fromJson(ex, index, startTime));
      index++;
      startTime += exercises.last.prelude! + exercises.last.duration!;
    }
    return WorkoutBean(
      title: json["title"] as String?,
      exercises: exercises,
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "exercises": exercises,
      };

  int getTotalTime() {
    int time = exercises!.fold(
      0,
      (previousValue, element) =>
          previousValue + element.prelude! + element.duration!,
    );
    return time;
  }

  @override
  List<Object?> get props => [title, exercises];

  @override
  bool? get stringify => true;
}
