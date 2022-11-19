import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_architecture/model/event_model.dart';

class EventFirebaseService {
  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection('events');

  Future<List<EventModel>>? getEvents() async {
    final events = await eventCollection.get();

    List<EventModel> eventList = [];

    eventList = events.docs
        .map(
          (event) => EventModel(
            websiteLink: event['website_link'],
            name: event['name'],
            description: event['description'],
            eventDate: event['event_date'],
            thumbnail: List<Thumbnail>.from(
                event["thumbnail"].map((x) => Thumbnail.fromJson(x))),
            address: Address.fromJson(event["address"]),
            sponseredBy: SponseredBy.fromJson(event["sponsered_by"]),
          ),
        )
        .toList();

    return eventList;
  }

}
