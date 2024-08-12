import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:signup/Models/cartmodel.dart';
import 'package:signup/home/Completedsuccessfully.dart';
import 'package:signup/home/home_view.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool isPaiementWhenReceiving = false;

  bool _isFormValid() {
    if (isPaiementWhenReceiving) {
      return true;
    }
    if (cardNumber.isNotEmpty &&
        expiryDate.isNotEmpty &&
        cardHolderName.isNotEmpty &&
        cvvCode.isNotEmpty) {
      return true;
    }
    return false;
  }

  void _showValidationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Validation Error'),
          content: const Text('Please fill in the visa or Pay on Delivery boxes'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 40),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: const Text(
                  'Check Out',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Oswald',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardWidget(
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      showBackView: isCvvFocused,
                      onCreditCardWidgetChange: (CreditCardBrand brand) {},
                      bankName: 'Name of the Bank',
                      glassmorphismConfig: Glassmorphism(
                        blurX: 0.0,
                        blurY: 0.0,
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black38],
                        ),
                      ),
                      enableFloatingCard: true,
                      floatingConfig: FloatingConfig(
                        isGlareEnabled: false,
                        isShadowEnabled: false,
                        shadowConfig: FloatingShadowConfig(
                          color: Colors.transparent,
                          offset: Offset(0, 0),
                        ),
                      ),
                      labelValidThru: 'VALID\nTHRU',
                      obscureCardNumber: true,
                      obscureInitialCardNumber: false,
                      obscureCardCvv: true,
                      labelCardHolder: 'CARD HOLDER',
                      cardType: CardType.mastercard,
                      isHolderNameVisible: false,
                      height: 165,
                      textStyle: TextStyle(color: Color.fromARGB(232, 214, 193, 3), fontWeight: FontWeight.bold),
                      width: MediaQuery.of(context).size.width,
                      isChipVisible: true,
                      isSwipeGestureEnabled: true,
                      animationDuration: Duration(milliseconds: 1000),
                      frontCardBorder: Border.all(color: Colors.transparent),
                      backCardBorder: Border.all(color: Colors.transparent),
                      chipColor: Color.fromARGB(232, 214, 193, 3),
                      padding: 15,
                    ),
                    IgnorePointer(
                      ignoring: isPaiementWhenReceiving,
                      child: CreditCardForm(
                        formKey: formKey,
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: (CreditCardModel data) {
                          setState(() {
                            cardNumber = data.cardNumber;
                            expiryDate = data.expiryDate;
                            cardHolderName = data.cardHolderName;
                            cvvCode = data.cvvCode;
                            isCvvFocused = data.isCvvFocused;
                          });
                        },
                        obscureCvv: true,
                        obscureNumber: true,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        enableCvv: true,
                        cvvValidationMessage: 'Please input a valid CVV',
                        dateValidationMessage: 'Please input a valid date',
                        numberValidationMessage: 'Please input a valid number',
                        cardNumberValidator: (String? cardNumber) {
                          if (cardNumber == null || cardNumber.isEmpty) {
                            return 'Card number is required';
                          }
                          return null;
                        },
                        expiryDateValidator: (String? expiryDate) {
                          if (expiryDate == null || expiryDate.isEmpty) {
                            return 'Expiry date is required';
                          }
                          return null;
                        },
                        cvvValidator: (String? cvv) {
                          if (cvv == null || cvv.isEmpty) {
                            return 'CVV is required';
                          }
                          return null;
                        },
                        cardHolderValidator: (String? cardHolderName) {
                          if (cardHolderName == null || cardHolderName.isEmpty) {
                            return 'Card holder name is required';
                          }
                          return null;
                        },
                        onFormComplete: () {
                          if (formKey.currentState?.validate() ?? false) {
                            print('Form is complete');
                          }
                        },
                        autovalidateMode: AutovalidateMode.always,
                        inputConfiguration: InputConfiguration(
                          cardNumberDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          ),
                          expiryDateDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expiry Date',
                            hintText: 'XX/XX',
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          ),
                          cvvCodeDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'XXX',
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          ),
                          cardHolderDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Card Holder',
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          ),
                          cardNumberTextStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          cardHolderTextStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          expiryDateTextStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          cvvCodeTextStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isPaiementWhenReceiving,
                          fillColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.disabled)) {
                                return Colors.black;
                              }
                              return Colors.black;
                            },
                          ),
                          onChanged: (bool? value) {
                            setState(() {
                              isPaiementWhenReceiving = value ?? false;
                            });
                          },
                        ),
                        const Text('Pay on Delivery', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: .4, color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('The price', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 16)),
                                  Text('\$${cartModel.totalPrice.toStringAsFixed(1)}', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 16)),
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.5,
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Delivery', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 16)),
                                  Text('\$30.0', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 16)),
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.5,
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                                  Text('\$${(cartModel.totalPrice + 30).toStringAsFixed(1)}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: GestureDetector(
                          onTap: () {
                                if (_isFormValid()) {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Completedsuccessfully()) 
                              );
                                } else {
                                  _showValidationDialog();
                                }
                              },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                             child: Text('Done', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
