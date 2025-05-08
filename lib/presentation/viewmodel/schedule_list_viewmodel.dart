
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:schedulesapp/data/datasource/fake_schedule_datasource.dart';
import 'package:schedulesapp/data/model/schedule.dart';

//viewModel
class ScheduleListViewModel extends StateNotifier<List<Schedule>> {

  final FakeScheduleDataSource _dataSource;

  ScheduleListViewModel(this._dataSource) : super([]) {
    fetchSchedules();
  }

  void fetchSchedules() {
    state = _dataSource.getSchedule();
  }

  void toggleCompleted(int id){
    state = [
      for (final schedule in state)
        if (schedule.id == id)
          schedule.copyWith(isCompleted: !schedule.isCompleted)
        else
          schedule
    ];
  }
}

//provider
final scheduleListViewModelProvider = StateNotifierProvider<ScheduleListViewModel, List<Schedule>> (
    (ref) => ScheduleListViewModel(FakeScheduleDataSource()),
);

