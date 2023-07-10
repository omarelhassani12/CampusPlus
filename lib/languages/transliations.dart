import 'package:get/get.dart';
import 'package:school_app/languages/ar.dart';
import 'package:school_app/languages/fr.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': ar,
        'fr': fr,
      };
}

