import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

void main() => runApp(PaymentPage());

class PaymentPage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<PaymentPage> {
  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '20',
      status: PaymentItemStatus.final_price,
    )
  ];
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DSC Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DSC Tutorial'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Payment'),
              GooglePayButton(
                paymentConfigurationAsset: 'images/gpay.json',
                paymentItems: _paymentItems,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: onGooglePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
