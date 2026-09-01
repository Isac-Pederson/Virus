import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:virus/data/model/repo/wko_repo.dart';
import 'package:virus/data/model/status.dart';
import 'package:virus/data/model/wko.dart';
import 'package:virus/ui/viewmodel/wko_list_state.dart';

class WkoListViewModel extends Notifier<WkoListState> {
  final _repo = WkoRepository();

  @override
  WkoListState build() {
    Future.microtask(loadAll);
    return const WkoListState(isLoading: true);
  }

  Future<void> loadAll() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final items = await _repo.getAll();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> addWko(Wko wko) async {
    wko = await _repo.insert(wko);
    await loadAll();
  }

  Future<void> updateWko(Wko wko) async{
    await _repo.update(wko);
    await loadAll();
  }


Wko createDraft({required bool isWko}) {
  if(isWko){
    return Wko(
      serverId: null,
      code: "",
      description: "",
      recordType: "W",
      updatedAt: DateTime.now(),
      status: Status.openStatus,
      convertStatus: null,
    );

  }else{
      return Wko(
      serverId: null,
      code: "",
      description: "",
      recordType: "M",
      updatedAt: DateTime.now(),
      status: null,
      convertStatus: Status.pendingStatus,
    );
  }
  }
}

final wkoListProvider = NotifierProvider<WkoListViewModel, WkoListState>(
  WkoListViewModel.new,
);
