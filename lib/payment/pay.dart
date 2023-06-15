// flutter_stripe: ^3.2.0

//  Stripe.publishableKey = stripePublishKey;
 //  await Stripe.instance.applySettings(); 



/*   Future<void> initPayment({
    required String email,
    required int amount,
  }) async {
    try {
      // 1. Create a payment intent on the server
      final response = await http.post(
          Uri.parse(
              'https://us-central1-orangeflutter-c956e.cloudfunctions.net/stripePaymentIntentRequest'),
          body: {
            'email': email,
            'amount': amount.toString(),
          });

      final jsonResponse = jsonDecode(response.body);
      log(jsonResponse.toString());
      // 2. Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: jsonResponse['paymentIntent'],
        merchantDisplayName: 'Helnay',
        customerId: jsonResponse['customer'],
        customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
        testEnv: false,

        //customFlow: true,
        merchantCountryCode: 'us',
      ));
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar("Successs !", 'Payment is successful !',
          snackPosition: SnackPosition.BOTTOM);
      addCoinApiCall(amount);
    } catch (errorr) {
      if (errorr is StripeException) {
        Get.snackbar(
          "Error !",
          'An error occure ${errorr.error.localizedMessage}',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error !",
          "An error occured $errorr",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
} */
