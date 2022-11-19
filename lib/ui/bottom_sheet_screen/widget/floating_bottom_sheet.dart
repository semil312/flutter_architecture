import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const FloatingBoxBottomSheet({
    required this.request,
    required this.completer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title ?? 'This is Bottom Sheet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[900],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            request.description ?? "This is Bottom Sheet Description...",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () => completer(SheetResponse(confirmed: true)),
                child: Text(
                  request.secondaryButtonTitle ?? "Done",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
              MaterialButton(
                onPressed: () => completer(SheetResponse(confirmed: false)),
                color: Theme.of(context).primaryColor,
                child: Text(
                  request.mainButtonTitle ?? "Agree",
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
