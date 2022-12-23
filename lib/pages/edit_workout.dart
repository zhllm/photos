import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo/bean/exercise_bean.dart';
import 'package:photo/bloc/workout_cubit.dart';
import 'package:photo/components/edit_exercise_screen.dart';
import 'package:photo/states/workout_states.dart';
import 'package:photo/utils/time_helper.dart';

class EditWorkoutScreen extends StatelessWidget {
  const EditWorkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: BlocBuilder<WorkoutCubit, WorkoutStates>(
        builder: (context, state) {
          WorkoutEditing workoutEditing = state as WorkoutEditing;
          return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () {
                  BlocProvider.of<WorkoutCubit>(context).goHome();
                },
              ),
            ),
            body: ListView.builder(
              itemCount: workoutEditing.workout!.exercises!.length,
              itemBuilder: (context, index) {
                ExerciseBean exerciseBean =
                    workoutEditing.workout!.exercises![index];
                if (index == workoutEditing.exIndex) {
                  return EditExerciseScreen(
                    exIndex: index,
                    index: workoutEditing.index,
                    workout: workoutEditing.workout,
                  );
                }
                return ListTile(
                  leading: Text(formatTime(exerciseBean.prelude!, true)),
                  title: Text(exerciseBean.title ?? ""),
                  trailing: Text(formatTime(exerciseBean.duration!, true)),
                  onTap: () {
                    BlocProvider.of<WorkoutCubit>(context).editExercise(index);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
