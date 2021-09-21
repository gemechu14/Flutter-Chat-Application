import "package:flutter/material.dart";

class ReplayCard extends StatelessWidget {
  ReplayCard(this.message);
  String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, right: 20, left: 10, bottom: 30),
                child: Text(
                 message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  " 20:11",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
