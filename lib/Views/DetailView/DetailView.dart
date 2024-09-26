//Detail page

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moovup_program_test/Common/Config/ColorGuide.dart';
import 'package:moovup_program_test/Common/Config/FontGuide.dart';
import 'package:moovup_program_test/Models/PeopleAPIModel.dart';
import 'package:moovup_program_test/Views/DetailView/DetailViewModel.dart';
import 'package:moovup_program_test/Views/MapView/MapView.dart';
import 'package:moovup_program_test/Common/Widgets/PeopleListItem.dart';
import 'package:moovup_program_test/Views/MapView/MapViewModel.dart';

class DetailView extends StatefulWidget {
  final DetailViewModel detailViewModel;

  const DetailView({super.key, required this.detailViewModel});

  @override
  State<StatefulWidget> createState() {
    return _DetailViewState();
  }
}

class _DetailViewState extends State<DetailView> {
  late DetailViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = widget.detailViewModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.detail_page,
          style: FontGuide.navigationBarTitle,
        ),
        backgroundColor: ColorGuide.mainTheme,
        leading: IconButton(
          key: const Key("Back"),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: MapView( //Insert the map view here
              person: vm.person,
              mapViewModel: MapViewModel(),
            ),
          ),
          PeopleListItem( //Information at bottom
              showEmail: true, showArrow: false, userModel: vm.person),
        ],
      ),
    );
  }
}
