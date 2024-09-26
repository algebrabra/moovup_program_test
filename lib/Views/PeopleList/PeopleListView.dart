import 'package:flutter/material.dart';
import 'package:moovup_program_test/Views/DetailView/DetailView.dart';
import 'package:moovup_program_test/Views/DetailView/DetailViewModel.dart';
import 'package:provider/provider.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:moovup_program_test/Models/PeopleListModel.dart';
import 'package:moovup_program_test/Views/PeopleList/PeopleListViewService.dart';
import 'package:moovup_program_test/Views/PeopleList/PeopleListViewModel.dart';
import 'package:moovup_program_test/Common/Widgets/PeopleListItem.dart';

class PeopleListView extends StatefulWidget {
  final PeopleListViewModel peopleListViewModel;

  const PeopleListView({super.key, required this.peopleListViewModel});

  @override
  State<StatefulWidget> createState() {
    return _PeopleListViewState();
  }
}

class _PeopleListViewState extends State<PeopleListView>
    with AutomaticKeepAliveClientMixin {
  late final PeopleListViewModel vm;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm = widget.peopleListViewModel;
    vm.addListener(() {
      if (!vm.isLoading) { // Update the share people list after loading
        Provider.of<PeopleListModel>(context, listen: false)
            .setPeople(vm.people);
      }
      setState(() {});
    });
    if (vm.people.isEmpty) { // If no record, call API
      vm.refresh();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: vm.isLoading && vm.people.isEmpty
          ? const LoadingIndicator( // Loading screen
              indicatorType: Indicator.ballClipRotateMultiple,
            )
          : RefreshIndicator(
              //scrollDirection: Axis.vertical,
              onRefresh: () async {
                vm.refresh();
              },
              child: vm.errorMessage != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            vm.errorMessage!,
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () {
                                vm.refresh();
                              },
                              child: const Text("Retry")),
                        ],
                      ),
                    )
                  : ListView.builder( // List out people
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: vm.people.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailView(
                                      detailViewModel: DetailViewModel(
                                          person: vm.people[index]))),
                            );
                          },
                          child: PeopleListItem(
                              showEmail: false, userModel: vm.people[index]),
                        );
                      },
                    ),
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
