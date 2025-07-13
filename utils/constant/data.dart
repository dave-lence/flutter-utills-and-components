import 'package:autovogue_main/utils/constant/image_strings.dart';

class ConstantData {
  List<String> carLogo = [
    CImage.teslaLogo,
    CImage.hondaLogo,
    CImage.toyotaLogo,
    CImage.bmwLogo,
    CImage.fordLogo,
    CImage.twitterSignIn,
    CImage.appleSignIn,
    CImage.googleSignIn,
  ];
  List<String> carPerks = [
    'Popular for Weddings',
    'Instant Book',
    'Chauffeur Included',
  ];

  List<Map<String, dynamic>> carSpecsAndRules = [
    {
      'heading': 'Specs & Features',
      'body': [
        {'icon': CImage.specsIcon, 'text': '6.75L V12 Twin-Turbo'},
        {
          'icon': CImage.specsIcon,
          'text': 'Cream leather + starry roof lighting',
        },
        {
          'icon': CImage.specsIcon,
          'text': 'Fridge, Champagne bucket, Sound system',
        },
        {'icon': CImage.specsIcon, 'text': 'Crimson Red Exterior'},
      ],
    },
    {
      'heading': 'What to Know Before You Ride',
      'body': [
        {'icon': CImage.infoIcon, 'text': 'No smoking inside the vehicle'},
        {'icon': CImage.infoIcon, 'text': 'Max passengers: 4'},
      ],
    },
  ];

  List<Map<String, dynamic>> insuranceTiers = [
    {
      'heading': 'Insurance Tiers',
      'body': [
        {
          'subbed': false,
          'tier': 'Basic',
          'text': 'Basic Liability Only Basic',
        },
        {
          'subbed': false,
          'tier': 'Premium',
          'text': 'Premium Covers minor damages Premium',
        },
        {'subbed': true, 'tier': 'VIP', 'text': 'VIP Full coverage VIP'},
      ],
    },
  ];

  List<String> howOften = ['Hourly', 'Daily', 'Weekend'];
  List<String> chooseTime = [
    '6:00AM - 7:00AM',
    '7:00AM - 8:00AM',
    '8:00AM - 9:00AM',
    '9:00AM - 10:00AM',
    '10:00AM - 11:00AM',
    '11:00AM - 12:00PM',
    '12:00PM - 1:00PM',
    '1:00PM - 2:00PM',
    '2:00PM - 3:00PM',
    '3:00PM - 4:00PM',
    '4:00PM - 5:00PM',
    '5:00PM - 6:00PM',
    '6:00PM - 7:00PM',
    '7:00PM - 8:00PM',
    '8:00PM - 9:00PM',
    '9:00PM - 10:00PM',
    '10:00PM - 11:00PM',
    '11:00PM - 12:00AM',
    '12:00AM - 1:00AM',
    '1:00AM - 2:00AM',
    '2:00AM - 3:00AM',
    '3:00AM - 4:00AM',
    '4:00AM - 5:00AM',
    '5:00AM - 6:00AM',
  ];

  List<Map<String, dynamic>> bookingType = [
    {
      'icon': CImage.instantIcon,

      'title': 'Instant Book',
      'description': 'Confirm now. No approval\nneeded.',
    },
    {
      'icon': CImage.timeFill,
      'title': 'Request Booking',
      'description': 'Wait for owner confirmation\nwithin 2 hours.',
    },
  ];

  List<Map<String, dynamic>> customRideOptions = [
    {
      'heading': 'Customize Your Ride',
      'body': [
        {
          'icon': CImage.musicIcon,
          'title': 'Music & Vibe',
          'description': 'Choose a playlist & interior fragrance',
        },
        {
          'icon': CImage.flowerIcon,
          'title': 'Flowers',
          'description': 'Bouquet on seat or in hand on arrival',
        },
        {
          'icon': CImage.bottleIcon,
          'title': 'Champagne',
          'description': 'Premium bottle ready on arrival',
        },
      ],
    },
    {
      'heading': 'Chauffeur Style',
      'body': [
        {
          'icon': CImage.casualIcon,
          'title': 'Classic Formal',
          'description': 'Black suit, white shirt, tie or bow tie',
        },
        {
          'icon': CImage.casualIcon,
          'title': 'Casual',
          'description': 'Crisp polo / button-down, fitted trousers',
        },
        {
          'icon': CImage.casualIcon,
          'title': 'Client Outfit',
          'description': 'You provide the outfit or guidelines',
        },
      ],
    },
  ];
}
