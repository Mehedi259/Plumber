class CountryCode {
  final String name;
  final String dialCode;
  final String code;
  final String flag;

  CountryCode({
    required this.name,
    required this.dialCode,
    required this.code,
    required this.flag,
  });

  @override
  String toString() => dialCode;
}

class CountryCodeData {
  static final List<CountryCode> countryCodes = [
    // Popular countries first
    CountryCode(name: 'Australia', dialCode: '+61', code: 'AU', flag: '🇦🇺'),
    CountryCode(name: 'United States', dialCode: '+1', code: 'US', flag: '🇺🇸'),
    CountryCode(name: 'United Kingdom', dialCode: '+44', code: 'GB', flag: '🇬🇧'),
    CountryCode(name: 'Canada', dialCode: '+1', code: 'CA', flag: '🇨🇦'),
    CountryCode(name: 'India', dialCode: '+91', code: 'IN', flag: '🇮🇳'),
    CountryCode(name: 'Pakistan', dialCode: '+92', code: 'PK', flag: '🇵🇰'),
    CountryCode(name: 'Bangladesh', dialCode: '+880', code: 'BD', flag: '🇧🇩'),
    
    // All other countries alphabetically
    CountryCode(name: 'Afghanistan', dialCode: '+93', code: 'AF', flag: '🇦🇫'),
    CountryCode(name: 'Albania', dialCode: '+355', code: 'AL', flag: '🇦🇱'),
    CountryCode(name: 'Algeria', dialCode: '+213', code: 'DZ', flag: '🇩🇿'),
    CountryCode(name: 'Argentina', dialCode: '+54', code: 'AR', flag: '🇦🇷'),
    CountryCode(name: 'Austria', dialCode: '+43', code: 'AT', flag: '🇦🇹'),
    CountryCode(name: 'Belgium', dialCode: '+32', code: 'BE', flag: '🇧🇪'),
    CountryCode(name: 'Brazil', dialCode: '+55', code: 'BR', flag: '🇧🇷'),
    CountryCode(name: 'China', dialCode: '+86', code: 'CN', flag: '🇨🇳'),
    CountryCode(name: 'Denmark', dialCode: '+45', code: 'DK', flag: '🇩🇰'),
    CountryCode(name: 'Egypt', dialCode: '+20', code: 'EG', flag: '🇪🇬'),
    CountryCode(name: 'France', dialCode: '+33', code: 'FR', flag: '🇫🇷'),
    CountryCode(name: 'Germany', dialCode: '+49', code: 'DE', flag: '🇩🇪'),
    CountryCode(name: 'Greece', dialCode: '+30', code: 'GR', flag: '🇬🇷'),
    CountryCode(name: 'Hong Kong', dialCode: '+852', code: 'HK', flag: '🇭🇰'),
    CountryCode(name: 'Indonesia', dialCode: '+62', code: 'ID', flag: '🇮🇩'),
    CountryCode(name: 'Iran', dialCode: '+98', code: 'IR', flag: '🇮🇷'),
    CountryCode(name: 'Iraq', dialCode: '+964', code: 'IQ', flag: '🇮🇶'),
    CountryCode(name: 'Ireland', dialCode: '+353', code: 'IE', flag: '🇮🇪'),
    CountryCode(name: 'Israel', dialCode: '+972', code: 'IL', flag: '🇮🇱'),
    CountryCode(name: 'Italy', dialCode: '+39', code: 'IT', flag: '🇮🇹'),
    CountryCode(name: 'Japan', dialCode: '+81', code: 'JP', flag: '🇯🇵'),
    CountryCode(name: 'Jordan', dialCode: '+962', code: 'JO', flag: '🇯🇴'),
    CountryCode(name: 'Kenya', dialCode: '+254', code: 'KE', flag: '🇰🇪'),
    CountryCode(name: 'Kuwait', dialCode: '+965', code: 'KW', flag: '🇰🇼'),
    CountryCode(name: 'Lebanon', dialCode: '+961', code: 'LB', flag: '🇱🇧'),
    CountryCode(name: 'Malaysia', dialCode: '+60', code: 'MY', flag: '🇲🇾'),
    CountryCode(name: 'Mexico', dialCode: '+52', code: 'MX', flag: '🇲🇽'),
    CountryCode(name: 'Morocco', dialCode: '+212', code: 'MA', flag: '🇲🇦'),
    CountryCode(name: 'Netherlands', dialCode: '+31', code: 'NL', flag: '🇳🇱'),
    CountryCode(name: 'New Zealand', dialCode: '+64', code: 'NZ', flag: '🇳🇿'),
    CountryCode(name: 'Nigeria', dialCode: '+234', code: 'NG', flag: '🇳🇬'),
    CountryCode(name: 'Norway', dialCode: '+47', code: 'NO', flag: '🇳🇴'),
    CountryCode(name: 'Oman', dialCode: '+968', code: 'OM', flag: '🇴🇲'),
    CountryCode(name: 'Philippines', dialCode: '+63', code: 'PH', flag: '🇵🇭'),
    CountryCode(name: 'Poland', dialCode: '+48', code: 'PL', flag: '🇵🇱'),
    CountryCode(name: 'Portugal', dialCode: '+351', code: 'PT', flag: '🇵🇹'),
    CountryCode(name: 'Qatar', dialCode: '+974', code: 'QA', flag: '🇶🇦'),
    CountryCode(name: 'Russia', dialCode: '+7', code: 'RU', flag: '🇷🇺'),
    CountryCode(name: 'Saudi Arabia', dialCode: '+966', code: 'SA', flag: '🇸🇦'),
    CountryCode(name: 'Singapore', dialCode: '+65', code: 'SG', flag: '🇸🇬'),
    CountryCode(name: 'South Africa', dialCode: '+27', code: 'ZA', flag: '🇿🇦'),
    CountryCode(name: 'South Korea', dialCode: '+82', code: 'KR', flag: '🇰🇷'),
    CountryCode(name: 'Spain', dialCode: '+34', code: 'ES', flag: '🇪🇸'),
    CountryCode(name: 'Sri Lanka', dialCode: '+94', code: 'LK', flag: '🇱🇰'),
    CountryCode(name: 'Sweden', dialCode: '+46', code: 'SE', flag: '🇸🇪'),
    CountryCode(name: 'Switzerland', dialCode: '+41', code: 'CH', flag: '🇨🇭'),
    CountryCode(name: 'Syria', dialCode: '+963', code: 'SY', flag: '🇸🇾'),
    CountryCode(name: 'Taiwan', dialCode: '+886', code: 'TW', flag: '🇹🇼'),
    CountryCode(name: 'Thailand', dialCode: '+66', code: 'TH', flag: '🇹🇭'),
    CountryCode(name: 'Turkey', dialCode: '+90', code: 'TR', flag: '🇹🇷'),
    CountryCode(name: 'Ukraine', dialCode: '+380', code: 'UA', flag: '🇺🇦'),
    CountryCode(name: 'United Arab Emirates', dialCode: '+971', code: 'AE', flag: '🇦🇪'),
    CountryCode(name: 'Vietnam', dialCode: '+84', code: 'VN', flag: '🇻🇳'),
    CountryCode(name: 'Yemen', dialCode: '+967', code: 'YE', flag: '🇾🇪'),
  ];

  static CountryCode get defaultCountry => countryCodes[0]; // Australia
}
