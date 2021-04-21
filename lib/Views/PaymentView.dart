import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

// ignore: must_be_immutable
class PaymentView extends StatelessWidget {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/brick_wall.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: buildBody(context),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("Payment"),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios),
        tooltip: ("Go back"),
      ),

    );
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CreditCardForm(
                    formKey: formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: cardNumber,
                    cvvCode: cvvCode,
                    cardHolderName: cardHolderName,
                    expiryDate: expiryDate,
                    themeColor: Colors.blue,
                    cardNumberDecoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                      // ignore: non_constant_identifier_names
                    ),
                    onCreditCardModelChange: (CreditCardModel) {},
                    // onCreditCardModelChange: onCreditCardModelChange,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      primary: const Color(0xff1b447b),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: const Text(
                        'Validate',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'halter',
                          fontSize: 14,
                          package: 'flutter_credit_card',
                        ),
                      ),
                    ),
                    onPressed: () {

                    },
                    // onPressed: () {
                    //   if (formKey.currentState!.validate()) {
                    //     print('valid!');
                    //   } else {
                    //     print('invalid!');
                    //   }
                    // },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

//
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  setState(Null Function() param0) {}
}

    // Widget buildBody(BuildContext context) {
    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       SizedBox(
    //           height: 200,
    //           width: 200,
    //           child: CircleAvatar(
    //             backgroundColor: Colors.transparent,
    //             backgroundImage: AssetImage("assets/img/pay.png"),
    //           )
    //       ),
    //       Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: TextField(
    //           decoration: InputDecoration(
    //             filled: true,
    //             fillColor: Colors.white.withOpacity(0.6),
    //             hintText: 'Enter your credit card number',
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.all(10.0),
    //         child: TextFormField(
    //           decoration: InputDecoration(
    //             filled: true,
    //             fillColor: Colors.white.withOpacity(0.6),
    //             labelText: 'Enter your month and year',
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(20),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }

