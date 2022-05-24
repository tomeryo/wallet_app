import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class ExistingCardsPage extends StatefulWidget {
  const ExistingCardsPage({Key? key}) : super(key: key);


  @override
  ExistingCardsPageState createState() => ExistingCardsPageState();
}

class ExistingCardsPageState extends State<ExistingCardsPage> {
  List cards = [{
    'cardNumber': '4242424242424242',
    'expiryDate': '04/24',
    'cardHolderName': 'Tomer Yosef',
    'cvvCode': '424',
  }, {
    'cardNumber': '5555555566554444',
    'expiryDate': '04/23',
    'cardHolderName': 'Stav Asaf',
    'cvvCode': '123',
  }, {
    'cardNumber': '378282246310005',
    'expiryDate': '01/27',
    'cardHolderName': 'Shir Shalom',
    'cvvCode': '315',
  }, {
    'cardNumber': '2223003122003222',
    'expiryDate': '08/26',
    'cardHolderName': 'Israel Israeli',
    'cvvCode': '123',
  }];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Existing cards')),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            var card = cards[index];
            return InkWell(
                child: GestureDetector(
                onTap: () {
                  ///This part of the code creates a transaction of payment on the specific card
                  ///The operation will not work in the emulator because it has no NFC component
                  // Stream<NDEFMessage> stream = NFC.readNDEF();
                  //
                  // stream.listen((NDEFMessage message) {
                  //   NDEFMessage newMessage = NDEFMessage.withRecords(
                  //       NDEFRecord.mime(card)
                  //   );
                  //   message.tag.write(newMessage);
                  // });
                  _showMyDialog();
                },
              child: CreditCardWidget(
                cardNumber: card['cardNumber'],
                expiryDate: card['expiryDate'],
                cardHolderName: card['cardHolderName'],
                cvvCode: card['cvvCode'],
                showBackView: false,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand ) {  },
              ),
                ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.network("https://i.pinimg.com/originals/0d/e4/1a/0de41a3c5953fba1755ebd416ec109dd.gif"),
          actions: <Widget>[
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}