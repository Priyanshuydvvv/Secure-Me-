import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'pa'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? paText = '',
  }) =>
      [enText, hiText, paText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // dashboard
  {
    '6v128mv3': {
      'en': 'Hey!',
      'hi': '',
      'pa': '',
    },
    '3o3id8qq': {
      'en': 'You are in a safe Location',
      'hi': '',
      'pa': '',
    },
    'u6pgkqcc': {
      'en': 'Live Active Users',
      'hi': '',
      'pa': '',
    },
    'l2fi7lwa': {
      'en': '5',
      'hi': '',
      'pa': '',
    },
    'my4b4vuw': {
      'en': 'Short by',
      'hi': '',
      'pa': '',
    },
    '8voog29k': {
      'en': 'Safety Center',
      'hi': '',
      'pa': '',
    },
    '7t670m87': {
      'en': 'Geo-Fencing ',
      'hi': '',
      'pa': '',
    },
    'mqudxrh2': {
      'en': 'Share Location',
      'hi': '',
      'pa': '',
    },
    'r7no3kc5': {
      'en': 'Snap a Shot',
      'hi': '',
      'pa': '',
    },
    'q4msdb9u': {
      'en': 'SOS',
      'hi': '',
      'pa': '',
    },
    'y70qq6a6': {
      'en': 'Dashboard',
      'hi': '',
      'pa': '',
    },
    '9ihxf0wq': {
      'en': '__',
      'hi': '',
      'pa': '',
    },
  },
  // shareloc
  {
    '11ac7q3i': {
      'en': '24k',
      'hi': '',
      'pa': '',
    },
    'rd0fnx76': {
      'en': 'Followers',
      'hi': '',
      'pa': '',
    },
    'qas9yylw': {
      'en': '152',
      'hi': '',
      'pa': '',
    },
    '7ue81nln': {
      'en': 'Following',
      'hi': '',
      'pa': '',
    },
    'j0t4iemh': {
      'en': 'Kavya Sharma',
      'hi': '',
      'pa': '',
    },
    'llyzrg3s': {
      'en': 'kavyasharma@gmail.com',
      'hi': '',
      'pa': '',
    },
    'ha0hxpjj': {
      'en': 'You are in a Safe Location',
      'hi': '',
      'pa': '',
    },
    '9dci5a6c': {
      'en': 'All Contacts',
      'hi': '',
      'pa': '',
    },
    '8cmi2mjn': {
      'en': 'Dad',
      'hi': '',
      'pa': '',
    },
    'qbin2o1d': {
      'en': '20 min away',
      'hi': '',
      'pa': '',
    },
    '8t46ness': {
      'en': 'Mom',
      'hi': '',
      'pa': '',
    },
    '4rk02jyl': {
      'en': '2hrs away',
      'hi': '',
      'pa': '',
    },
    'w65nlrvr': {
      'en': 'Bro',
      'hi': '',
      'pa': '',
    },
    '6ipec6rz': {
      'en': '2.5 hr Away',
      'hi': '',
      'pa': '',
    },
    'wwfdre3w': {
      'en': 'Sahil',
      'hi': '',
      'pa': '',
    },
    'f0h8ivq8': {
      'en': '18 min away',
      'hi': '',
      'pa': '',
    },
    'lw4s76ay': {
      'en': 'Your Profile',
      'hi': '',
      'pa': '',
    },
    'w73nipc8': {
      'en': 'Home',
      'hi': '',
      'pa': '',
    },
  },
  // snapashot
  {
    'cnwd8tlx': {
      'en': 'Snap a Shot!',
      'hi': '',
      'pa': '',
    },
    'z5j9z70q': {
      'en': 'Fill out the form below to submit!',
      'hi': '',
      'pa': '',
    },
    '6e4mdu0u': {
      'en': 'What\'s happening...',
      'hi': '',
      'pa': '',
    },
    '5tpi9xo6': {
      'en': 'Short Description of what is going on...',
      'hi': '',
      'pa': '',
    },
    '7po1dflf': {
      'en': 'Upload Screenshot',
      'hi': '',
      'pa': '',
    },
    'em1olywg': {
      'en': 'Submit ',
      'hi': '',
      'pa': '',
    },
    'no11xqzr': {
      'en': 'Secure Me',
      'hi': '',
      'pa': '',
    },
    'vute786q': {
      'en': 'Home',
      'hi': '',
      'pa': '',
    },
  },
  // safetycenter
  {
    '98dagx9v': {
      'en': 'Legal Aid',
      'hi': '',
      'pa': '',
    },
    '6pzelag9': {
      'en': 'SOS',
      'hi': '',
      'pa': '',
    },
    'l4g2ihgl': {
      'en': 'Her Doc',
      'hi': '',
      'pa': '',
    },
    'm7ajhgi3': {
      'en': 'Panic Room',
      'hi': '',
      'pa': '',
    },
    'wcu6vxr6': {
      'en': 'Shop',
      'hi': '',
      'pa': '',
    },
  },
  // geofencing
  {
    'zbsgglsm': {
      'en': 'Check out the safe zones ',
      'hi': '',
      'pa': '',
    },
    'zl17w2av': {
      'en': 'Current Location ',
      'hi': '',
      'pa': '',
    },
    'udi1v5yb': {
      'en': 'An overview of your route.',
      'hi': '',
      'pa': '',
    },
    'dm2gb4qs': {
      'en': 'Gharuan',
      'hi': '',
      'pa': '',
    },
    '38avwv4x': {
      'en': 'You are in a safer Location ',
      'hi': '',
      'pa': '',
    },
    'ad6oz1sq': {
      'en': 'Nearby Location',
      'hi': '',
      'pa': '',
    },
    '9nrvm044': {
      'en': 'A record of past incidents ',
      'hi': '',
      'pa': '',
    },
    '5n1oq4fe': {
      'en': 'Kharar',
      'hi': '',
      'pa': '',
    },
    'i7yfyhcp': {
      'en': '18 Unusuall incidents have be seen in past 1 Year',
      'hi': '',
      'pa': '',
    },
    'snzajkv2': {
      'en': 'Mohali',
      'hi': '',
      'pa': '',
    },
    'zqp4ouur': {
      'en': '3  Unusuall incident have be recorded in past 1 Year',
      'hi': '',
      'pa': '',
    },
    'onnfrmma': {
      'en': 'Geofencing\n',
      'hi': '',
      'pa': '',
    },
    'mbmfae9w': {
      'en': 'Home',
      'hi': '',
      'pa': '',
    },
  },
  // chat_ai_Screen
  {
    'cio1yybw': {
      'en': 'Ai Chat',
      'hi': '',
      'pa': '',
    },
    'vftwom75': {
      'en': 'Home',
      'hi': '',
      'pa': '',
    },
  },
  // Auth1
  {
    'qqczcl5m': {
      'en': 'Women Safety App',
      'hi': '',
      'pa': '',
    },
    'f7ii4scc': {
      'en': 'Secure Me ',
      'hi': '',
      'pa': '',
    },
    'mt3y8es7': {
      'en': 'Sign In',
      'hi': '',
      'pa': '',
    },
    'aeubq56j': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': '',
      'pa': '',
    },
    '9hwtnbnj': {
      'en': 'Email',
      'hi': '',
      'pa': '',
    },
    '7n72syze': {
      'en': 'Password',
      'hi': '',
      'pa': '',
    },
    'fbp53ry5': {
      'en': 'Sign In',
      'hi': '',
      'pa': '',
    },
    'wwand0cc': {
      'en': 'Forgot Password',
      'hi': '',
      'pa': '',
    },
    '6whnudfq': {
      'en': 'Sign Up',
      'hi': '',
      'pa': '',
    },
    'olpppk6p': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': '',
      'pa': '',
    },
    'giqq2sum': {
      'en': 'Email',
      'hi': '',
      'pa': '',
    },
    'jlc0mkuy': {
      'en': 'Password',
      'hi': '',
      'pa': '',
    },
    '7fu6bztf': {
      'en': 'Confirm Password',
      'hi': '',
      'pa': '',
    },
    'qhoj2roj': {
      'en': 'Create Account',
      'hi': '',
      'pa': '',
    },
    'dm0bh6zj': {
      'en': 'Home',
      'hi': '',
      'pa': '',
    },
  },
  // forgetpasswrod
  {
    'yryj2urf': {
      'en': 'Back',
      'hi': '',
      'pa': '',
    },
    'ymkupmwq': {
      'en': 'Forgot Password',
      'hi': '',
      'pa': '',
    },
    '3393ozez': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'hi': '',
      'pa': '',
    },
    'v3u20o7e': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'x982dnyx': {
      'en': 'Enter  Your Email.....',
      'hi': '',
      'pa': '',
    },
    'dwtpc352': {
      'en': 'Send Link',
      'hi': '',
      'pa': '',
    },
    'hpzlpw75': {
      'en': 'Secure Me',
      'hi': '',
      'pa': '',
    },
    'yhd03hz8': {
      'en': 'Home',
      'hi': '',
      'pa': '',
    },
  },
  // emptyList
  {
    'sgjss3nu': {
      'en': 'Ai Chat Active!',
      'hi': '',
      'pa': '',
    },
    '8qg6f7lx': {
      'en':
          'IMPORTANT!!! Need to do:\nGo to the action below and update your API Key in order for this chat to function.\n\nYou can get an API key at:',
      'hi': '',
      'pa': '',
    },
    'feynszim': {
      'en': 'https://platform.openai.com',
      'hi': '',
      'pa': '',
    },
    'h6s6mgdl': {
      'en': 'Watch Tutorial',
      'hi': '',
      'pa': '',
    },
  },
  // aiChat_Component
  {
    'hzjvev37': {
      'en': 'Copy response',
      'hi': '',
      'pa': '',
    },
    'jsiwczqg': {
      'en': 'Type something...',
      'hi': '',
      'pa': '',
    },
  },
  // Miscellaneous
  {
    'pdvjh3vw': {
      'en': 'For your safety press on the allow ',
      'hi': '',
      'pa': '',
    },
    '6n4efxim': {
      'en': 'For your safety press on the allow ',
      'hi': '',
      'pa': '',
    },
    't2qd8kxc': {
      'en': 'For your safety press on the allow ',
      'hi': '',
      'pa': '',
    },
    's4xcxdy6': {
      'en': 'For your safety press on the allow ',
      'hi': '',
      'pa': '',
    },
    'd8gr4zhn': {
      'en': 'For your safety press on the allow ',
      'hi': '',
      'pa': '',
    },
    'dzdmo1x4': {
      'en': 'For your safety press on the allow ',
      'hi': '',
      'pa': '',
    },
    'c0s2l370': {
      'en': 'For your safety press on the allow ',
      'hi': '',
      'pa': '',
    },
    'vfonz2t5': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'zwfdj2ik': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'cf02kzjb': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'qpnosp8t': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'fkwq12q8': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'nvtxx3hq': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'j20yovtj': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'mk5hkfnq': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '0klbiwx5': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'zqqct68v': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'e85svvyp': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'za6uvyvm': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '92icrgt0': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    '29a5rsge': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'alam2nmq': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'loc0nhoo': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'nvvimq35': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'dbokdt68': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'alqevsb7': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'jesz86j4': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'b2pdh21i': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'vudkyejr': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'grtg8vpt': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'ph4rbkuc': {
      'en': '',
      'hi': '',
      'pa': '',
    },
    'ii82qal1': {
      'en': '',
      'hi': '',
      'pa': '',
    },
  },
].reduce((a, b) => a..addAll(b));
