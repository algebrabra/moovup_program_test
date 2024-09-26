//Integration Test

import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:moovup_program_test/Views/MapView/MapView.dart';
import 'package:moovup_program_test/Views/DetailView/DetailView.dart';
import 'package:moovup_program_test/Views/PeopleList/PeopleListView.dart';
import 'package:moovup_program_test/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Integration test from main", () {
    testWidgets("Full test", (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle();

      //Check people list
      expect(find.text('Bradley Bass'), findsOneWidget);
      expect(find.text('Amparo Calhoun'), findsOneWidget);
      expect(find.text('Celina Allen'), findsOneWidget);
      expect(find.text('Valentine Diaz'), findsOneWidget);

      //Enter detail page
      await tester.tap(find.text('Bradley Bass'));
      await tester.pumpAndSettle();

      //Check is enter DetailView
      expect(find.byType(PeopleListView), findsNothing);
      expect(find.byType(DetailView), findsOneWidget);
      expect(find.text('Bradley Bass'), findsOneWidget);
      expect(find.text('aida.griffith@sybixtex.show'), findsOneWidget);

      //Press back button
      await tester.tap(find.byKey(const Key('Back')));
      await tester.pumpAndSettle();

      //Check is back to PeopleListView
      expect(find.byType(DetailView), findsNothing);
      expect(find.byType(PeopleListView), findsOneWidget);

      //Choose people map
      await tester.tap(find.byKey(const Key('People Map')));
      await tester.pumpAndSettle();

      //Check map
      expect(find.byType(MapView), findsOneWidget);
      expect(find.text('Bradley Bass'), findsNothing);
      expect(find.byType(FlutterMap), findsOneWidget);

      //Go back to people list
      await tester.tap(find.byKey(const Key('People List')));
      await tester.pumpAndSettle();

      //Scroll down
      final gesture = await tester.startGesture(
          const Offset(0, 300)); //Position of the scrollview
      await gesture.moveBy(const Offset(0, -360)); //Scroll down 3 records
      await tester.pumpAndSettle();
      expect(find.text('Susanna Patel'), findsOneWidget);

    });
  });
}