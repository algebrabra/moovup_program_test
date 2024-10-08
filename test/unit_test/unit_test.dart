import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moovup_program_test/Common/Config/Environment.dart';
import 'package:moovup_program_test/Common/Services/APIService.dart';
import 'package:moovup_program_test/Models/PeopleAPIModel.dart';
import 'package:moovup_program_test/Views/MapView/MapViewModel.dart';
import 'package:moovup_program_test/Views/PeopleList/PeopleListViewModel.dart';
import 'package:http/http.dart' as http;
import 'package:moovup_program_test/Views/PeopleList/PeopleListViewService.dart';

class MockPeopleListViewModel extends Mock implements PeopleListViewModel {
  @override
  Future<void> refresh() async {
  }
}

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;

  //Define success API response
  setupSuccess() {
    mockClient = MockClient((_) async =>
    http.Response("""[{"_id":"ae736d8f-5a08-4bab-8e30-1eb2079e5dc2","name":{"last":"Bass","first":"Bradley"},"email":"aida.griffith@sybixtex.show","picture":"https://placebear.com/225/210","location":{"latitude":22.38,"longitude":null}},{"_id":"ae61bba4-4110-45a7-84c5-ab1c08a86a1d","name":{"last":"Calhoun","first":"Amparo"},"email":"sue.patterson@exoteric.press","picture":"https://placebear.com/60/121","location":{"latitude":22.37,"longitude":113.34}},{"_id":"86615bf5-9815-4f70-8ade-a76d2a6c3d56","name":{"last":"Allen","first":"Celina"},"email":"lula.dillard@syntac.pn","picture":"https://placebear.com/85/236","location":{"latitude":22.35,"longitude":null}},{"_id":"6859e2f6-e4dd-4b66-955c-f7a9ac0534e2","name":{"last":"Diaz","first":"Valentine"},"email":"lynn.valdez@steeltab.ga","picture":"https://placebear.com/236/219","location":{"latitude":22.36,"longitude":114.18}},{"_id":"604296df-03a2-4ad2-8621-4c70e25cf3c4","name":{"last":"Kirk","first":"Carney"},"email":"vazquez.harper@ozean.gbiz","picture":"https://placebear.com/235/120","location":{"latitude":22.36,"longitude":null}},{"_id":"29c4a883-048a-428f-9ef6-e711fc160fd4","name":{"last":"Patel","first":"Susanna"},"email":"glenda.hobbs@kiggle.reviews","picture":"https://placebear.com/103/85","location":{"latitude":22.34,"longitude":113.45}},{"_id":"f2622c46-b18b-473f-a15b-5b70eefc021d","name":{"last":"Osborn","first":"Huber"},"email":"janelle.underwood@farmex.mo","picture":"https://placebear.com/177/239","location":{"latitude":22.31,"longitude":null}},{"_id":"12dfa7f0-ba93-46d0-9082-76ea881f5583","name":{"last":"Potter","first":"Katina"},"email":"lelia.carr@metroz.kitchen","picture":"https://placebear.com/147/65","location":{"latitude":22.36,"longitude":null}},{"_id":"0523b7e0-8501-4e06-86cb-a328983afb29","name":{"last":"Barr","first":"Cline"},"email":"jo.hayden@ultrimax.accenture","picture":"https://placebear.com/223/182","location":{"latitude":22.36,"longitude":null}},{"_id":"50c9f74f-1ae1-456f-bace-a7f74f5733b6","name":{"last":"Navarro","first":"Colon"},"email":"ava.delacruz@baluba.tattoo","picture":"https://placebear.com/160/120","location":{"latitude":22.34,"longitude":null}},{"_id":"a81ee2df-7c86-4ae4-b9fa-c4ebe5564892","name":{"last":"Mooney","first":"Imelda"},"email":"lindsey.wise@zinca.horse","picture":"https://placebear.com/221/108","location":{"latitude":22.39,"longitude":113.99}},{"_id":"62da63fc-60b5-4876-9555-1f209123bd94","name":{"last":"Acosta","first":"Shauna"},"email":"josefina.lindsey@geologix.cars","picture":"https://placebear.com/190/113","location":{"latitude":22.37,"longitude":113.78}},{"_id":"63855f28-1810-4a4d-994c-47ae53224f60","name":{"last":"Sexton","first":"Beatriz"},"email":"nadia.love@avit.irish","picture":"https://placebear.com/211/249","location":{"latitude":22.32,"longitude":null}},{"_id":"c1b1299d-3708-4eb0-9fb6-9a2b5541622c","name":{"last":"Robinson","first":"Joann"},"email":"gwendolyn.newton@exerta.sener","picture":"https://placebear.com/118/76","location":{"latitude":22.34,"longitude":113.33}},{"_id":"063a226b-525f-4e47-8564-addcce175130","name":{"last":"Trujillo","first":"Fisher"},"email":"adrienne.chambers@zentury.parts","picture":"https://placebear.com/140/219","location":{"latitude":22.35,"longitude":null}},{"_id":"212f69f8-53e7-4891-8c0c-09dd6bcbe365","name":{"last":"Brennan","first":"Nell"},"email":"bobbie.pruitt@straloy.accountants","picture":"https://placebear.com/68/107","location":{"latitude":22.33,"longitude":null}},{"_id":"9cdf8706-bd70-434f-8aa1-73022ee6ba94","name":{"last":"Snyder","first":"Atkinson"},"email":"castillo.edwards@roboid.partners","picture":"https://placebear.com/132/177","location":{"latitude":22.35,"longitude":null}},{"_id":"35efa223-ef27-4d18-8a84-cdd85804f6d7","name":{"last":"Avery","first":"Erickson"},"email":"joyce.burt@comveyer.tienda","picture":"https://placebear.com/232/183","location":{"latitude":22.36,"longitude":null}},{"_id":"b75aa81f-4b67-4562-82d7-1916000577f7","name":{"last":"Cardenas","first":"Sargent"},"email":"robyn.foster@stralum.ma","picture":"https://placebear.com/226/151","location":{"latitude":22.31,"longitude":null}},{"_id":"2f0cccbf-340e-452c-b0db-67d6df66bc8a","name":{"last":"Holden","first":"Roxie"},"email":"jenna.wiley@protodyne.industries","picture":"https://placebear.com/96/217","location":{"latitude":22.37,"longitude":null}},{"_id":"de47da41-aa5f-4ffa-89cd-b4674ba0fa0f","name":{"last":"Dodson","first":"Carissa"},"email":"selena.fletcher@isoternia.wf","picture":"https://placebear.com/232/221","location":{"latitude":22.35,"longitude":113.39}},{"_id":"f90482e5-f695-48fc-be77-e5db7dfd94f7","name":{"last":"Cain","first":"Anna"},"email":"henderson.daniel@nurali.hiv","picture":"https://placebear.com/245/127","location":{"latitude":22.36,"longitude":113.58}},{"_id":"f7abee84-b59b-4e75-ba46-8d99d75b22e6","name":{"last":"Morse","first":"Regina"},"email":"terri.ramirez@coash.capital","picture":"https://placebear.com/222/207","location":{"latitude":22.35,"longitude":114.06}},{"_id":"a05407cf-45a0-40a4-a319-a78a8914c6e0","name":{"last":"Best","first":"Duke"},"email":"melva.watts@undertap.productions","picture":"https://placebear.com/229/93","location":{"latitude":22.36,"longitude":113.89}},{"_id":"634998b2-918a-4430-9795-e0c475695dc3","name":{"last":"Benson","first":"Colleen"},"email":"newman.kaufman@apex.us","picture":"https://placebear.com/64/135","location":{"latitude":22.31,"longitude":113.74}},{"_id":"c4391b42-2020-4b50-941b-ba7e2f835f40","name":{"last":"Fleming","first":"Eaton"},"email":"margie.ball@dadabase.toray","picture":"https://placebear.com/88/212","location":{"latitude":22.38,"longitude":null}},{"_id":"d72fbcef-f5c9-4cab-875e-09f206bd97a1","name":{"last":"Pickett","first":"Kris"},"email":"daisy.melton@stelaecor.tc","picture":"https://placebear.com/234/215","location":{"latitude":22.37,"longitude":113.35}},{"_id":"ed847ef7-4a75-4fb8-9062-596db0829cd6","name":{"last":"Hooper","first":"Sellers"},"email":"manning.thomas@kyagoro.repair","picture":"https://placebear.com/246/53","location":{"latitude":22.34,"longitude":null}},{"_id":"b7b388fe-3804-41fa-a253-9aacc5329a14","name":{"last":"Schmidt","first":"Rosa"},"email":"cross.schultz@fishland.sl","picture":"https://placebear.com/157/146","location":{"latitude":22.39,"longitude":113.78}},{"_id":"c2687929-378c-43c9-9d97-53b0e22729b0","name":{"last":"Le","first":"Virgie"},"email":"perez.gross@gracker.kim","picture":"https://placebear.com/63/142","location":{"latitude":22.31,"longitude":114.02}},{"_id":"03b9d0d6-097d-4540-9e67-8dde7236078a","name":{"last":"Abbott","first":"Tanya"},"email":"warner.berger@zenthall.coop","picture":"https://placebear.com/207/174","location":{"latitude":22.36,"longitude":113.39}},{"_id":"2cbe3c7a-3a7b-4146-80d2-63bf211b68a6","name":{"last":"Grimes","first":"Marisol"},"email":"shawn.wolfe@oulu.spiegel","picture":"https://placebear.com/86/50","location":{"latitude":22.34,"longitude":113.51}},{"_id":"6b3364c8-df2b-47ba-8b69-7e76c14b704d","name":{"last":"Huff","first":"Charity"},"email":"carlene.ingram@sarasonic.dnp","picture":"https://placebear.com/123/165","location":{"latitude":22.31,"longitude":null}},{"_id":"b19e3010-dd74-475f-bd2c-2a55594156b5","name":{"last":"Guerrero","first":"Sheila"},"email":"ollie.townsend@norsup.tm","picture":"https://placebear.com/100/112","location":{"latitude":22.32,"longitude":113.51}},{"_id":"2638a456-a546-47fa-b36e-661273c2430c","name":{"last":"Stone","first":"Kaitlin"},"email":"linda.morris@letpro.lotte","picture":"https://placebear.com/100/76","location":{"latitude":22.36,"longitude":113.36}},{"_id":"73047572-e616-424e-8cb1-676c99fc3d29","name":{"last":"Cantrell","first":"Faith"},"email":"jenkins.wade@radiantix.nyc","picture":"https://placebear.com/165/116","location":{"latitude":22.37,"longitude":113.44}},{"_id":"a1dd5e36-b27b-415d-abf9-cea953e6c1c2","name":{"last":"Dotson","first":"Elizabeth"},"email":"bright.mcknight@retrotex.golf","picture":"https://placebear.com/183/184","location":{"latitude":22.36,"longitude":null}},{"_id":"b6870f7b-f9ff-4140-a84b-1121d11774d1","name":{"last":"Sheppard","first":"Solis"},"email":"pennington.hendricks@gleamink.ruhr","picture":"https://placebear.com/233/65","location":{"latitude":22.31,"longitude":null}},{"_id":"1d78ecc2-b39c-40d7-91ba-727104c9178d","name":{"last":"Fitzpatrick","first":"Wall"},"email":"huff.west@isopop.joburg","picture":"https://placebear.com/232/165","location":{"latitude":22.39,"longitude":114.08}},{"_id":"fccc0801-064a-4b54-822e-61fefe08cf22","name":{"last":"Roberts","first":"Rene"},"email":"dejesus.kramer@kyaguru.gives","picture":"https://placebear.com/99/190","location":{"latitude":22.34,"longitude":null}}]""", 200));
    APIService.shared.client = mockClient;
  }

  //Define fail API response
  setupNotFound() {
    mockClient = MockClient((_) async =>
        http.Response("Not found", 404));
    APIService.shared.client = mockClient;
  }
  
  test("PeopleListService API success Test", () async {

    //Setup
    setupSuccess();

    expect(APIService.shared.client, isA<MockClient>());
    PeopleListService service = PeopleListService();
    PeopleResponseModel model = await service.fetchPeople();
    expect(model, isA<PeopleResponseModel>());
    expect(model.people!.length, 40);
  });

  test("PeopleListService API fail Test", () async {

    //Setup
    setupNotFound();

    expect(APIService.shared.client, isA<MockClient>());
    PeopleListService service = PeopleListService();
    PeopleResponseModel model = await service.fetchPeople();
    expect(model, isA<PeopleResponseModel>());
    expect(model.errorCode, 404);
    expect(model.errorMessage, "Not found");
  });

  test("PeopleListViewModel unit test", () async {

    //Setup
    setupSuccess();
    PeopleListViewModel peopleListViewModel = PeopleListViewModel();
    int iteration = 0;
    peopleListViewModel.addListener(() {

      //Check result
      expect(peopleListViewModel.errorCode, null);
      expect(peopleListViewModel.errorMessage, null);
      if (iteration == 0) { //Before refresh
        expect(peopleListViewModel.people.length, 0);
      } else if (iteration == 1) { //After refresh
        expect(peopleListViewModel.people.length, 40);
      }
      iteration += 1;
    });

    //Run
    peopleListViewModel.refresh();

  });

  test("PeopleListViewModel unit error test", () async {

    //Setup
    setupNotFound();
    PeopleListViewModel peopleListViewModel = PeopleListViewModel();
    int iteration = 0;
    peopleListViewModel.addListener(() {

      //Check result
      if (iteration == 0) { //Before refresh
        expect(peopleListViewModel.errorCode, null);
        expect(peopleListViewModel.errorMessage, null);
        expect(peopleListViewModel.people.length, 0);
      } else if (iteration == 1) { //After refresh
        expect(peopleListViewModel.errorCode, 404);
        expect(peopleListViewModel.errorMessage, "Not found");
        expect(peopleListViewModel.people.length, 0);
      }
      iteration += 1;
    });

    //Run
    peopleListViewModel.refresh();

  });

  test("MapViewModel unit test", () async {

    //Setup
    MapViewModel mapViewModel = MapViewModel();

    NameModel nameModel = NameModel(first: "Chan", last: "Tai Man");
    LocationModel locationModel = LocationModel(latitude: 22.2,
        longitude: 114.3);
    PersonModel personModel = PersonModel(name: nameModel, picture: "", email: "124@234.com", location: locationModel);

    NameModel nameModel2 = NameModel(first: "Chan2", last: "Tai Man2");
    LocationModel locationModel2 = LocationModel(
        latitude: Environment.initial_center_debug.latitude,
        longitude: Environment.initial_center_debug.longitude);
    PersonModel personModel2 = PersonModel(
        name: nameModel2,
        picture: "",
        email: "124@2345.com",
        location: locationModel2);

    //Run and check result
    expect(mapViewModel.getInitialCenter().latitude, Environment.initial_center_debug.latitude);
    expect(mapViewModel.getInitialCenter().longitude, Environment.initial_center_debug.longitude);

    mapViewModel.people = [personModel, personModel2];

    expect(mapViewModel.getInitialCenter().latitude, 22.2);
    expect(mapViewModel.getInitialCenter().longitude, 114.3);

    mapViewModel.people.removeAt(0);

    expect(mapViewModel.getInitialCenter().latitude, Environment.initial_center_debug.latitude);
    expect(mapViewModel.getInitialCenter().longitude, Environment.initial_center_debug.longitude);

  });
}