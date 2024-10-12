import 'package:get/get.dart';

import 'en.dart';
import 'id.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': En.dictionary,
        'id_ID': Id.dictionary,
      };
}
