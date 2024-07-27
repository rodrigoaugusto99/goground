// abstract class SmartDevice {
//   void makeCall();
//   void sendEmail();
//   void browseInternet();
//   void takePicture();
// }

// class SmartPhone implements SmartDevice {
//   @override
//   void browseInternet() {
//     // TODO: implement browseInternet
//   }

//   @override
//   void makeCall() {
//     // TODO: implement makeCall
//   }

//   @override
//   void sendEmail() {
//     // TODO: implement sendEmail
//   }

//   @override
//   void takePicture() {
//     // TODO: implement takePicture
//   }
// }

// class SmartWatch implements SmartDevice {
//   @override
//   void browseInternet() {
//     throw UnimplementedError('This device cannot browse internet');
//   }

//   @override
//   void makeCall() {
//     // TODO: implement makeCall
//   }

//   @override
//   void sendEmail() {
//     throw UnimplementedError('This device cannot send email');
//   }

//   @override
//   void takePicture() {
//     throw UnimplementedError('This device cannot take pictures');
//   }
// }

/*
no codigo acima, estamos forcando o relogio a implementar
acoes que ele nao consegue, forcando o relogio a depender
de metodos que ele nao usa.
 */

abstract class Phone {
  void makeCall();
}

abstract class EmailDevice {
  void sendEmail();
}

abstract class WebBrowser {
  void browseInternet();
}

abstract class Camera {
  void takePicture();
}

class SmartWatch implements Phone {
  @override
  void makeCall() {
    // TODO: implement makeCall
  }
}

class SmartPhone implements Phone, EmailDevice, WebBrowser, Camera {
  @override
  void browseInternet() {
    // TODO: implement browseInternet
  }

  @override
  void makeCall() {
    // TODO: implement makeCall
  }

  @override
  void sendEmail() {
    // TODO: implement sendEmail
  }

  @override
  void takePicture() {
    // TODO: implement takePicture
  }
}
