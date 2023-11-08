import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transaction Page',
      home: TransactionPage(),
    );
  }
}

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final _formKey = GlobalKey<FormState>();
  String transactionId = '';
  double amount = 0.0;

  void _submitForm() {
  final currentState = _formKey.currentState;
  if (currentState?.validate() ?? false) {
    currentState?.save(); // Use the null-aware operator before calling save
    print('Transaction ID: $transactionId');
    print('Amount: $amount');
    // You can replace this print statement with your action, like API call
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transact'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Transaction ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the transaction ID';
                  }
                  return null;
                },

                onSaved: (value) => transactionId = value ?? '',
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount';
                  }
                  // Add any additional validation for the amount field if necessary.
                  return null;
                },

                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    amount = double.tryParse(value) ?? 0.0;
                  }
                },

                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
