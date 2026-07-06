import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:virus/ui/viewmodel/wko_list_viewmodel.dart';

class WkoListView extends ConsumerWidget {
  const WkoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(wkoListProvider);
    final vm = ref.read(wkoListProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Work Orders')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
          ? Center(child: Text('Error: ${state.error}'))
          : RefreshIndicator(
              onRefresh: vm.loadAll,
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, i) {
                  final wko = state.items[i];
                  return ListTile(
                    title: Text(wko.code.isEmpty ? '(no code)' : wko.code),
                    subtitle: Text(wko.description),
                    trailing: Text(wko.status.description),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => vm.addWko(vm.createDraftForTesting()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
