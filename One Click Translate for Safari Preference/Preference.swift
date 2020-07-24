//
//  Preference.swift
//  One Click Translate for Safari
//
//  Created by user on 7/19/20.
//  Copyright © 2020 Dmitry Rodin. All rights reserved.
//

import Cocoa

class Preference: NSObject {
    static let defaults = UserDefaults(suiteName: Bundle.main.object(forInfoDictionaryKey: "SuiteName")! as? String)!

    static var engine: String {
        get {
            return defaults.string(forKey: "Engine") ?? "Google"
        }
        set {
            defaults.set(newValue, forKey: "Engine")
            if translationLanguages[language] == nil {
                language = "English"
            }
        }
    }

    static var language: String {
        get {
            return defaults.string(forKey: "Language") ?? "English"
        }
        set {
            defaults.set(newValue, forKey: "Language")
        }
    }

    static var translationLanguages: [String: String] {
        get {
            return translationEngines[engine]!.languages
        }
    }

    static var translationUrl: String {
        get {
            return String(format: translationEngines[engine]!.url, translationLanguages[language]!)
        }
    }
    
    static var translationText: String {
        get {
            return String(format: translationEngines[engine]!.text, translationLanguages[language]!)
        }
    }

    struct translationEngineStruct {
        var url: String
        var text: String
        var languages: [String: String]
    }

    static let translationEngines = [
        "Google": translationEngineStruct(
            url: "https://translate.google.com/translate?hl=%1$@&sl=auto&tl=%1$@&u=",
            text: "https://translate.google.com/?hl=%1$@&sl=auto&tl=%1$@&text=",
            languages: [
                "Afrikaans": "af",
                "Albanian": "sq",
                "Amharic": "am",
                "Arabic": "ar",
                "Armenian": "hy",
                "Azerbaijani": "az",
                "Basque": "eu",
                "Belarusian": "be",
                "Bengali": "bn",
                "Bosnian": "bs",
                "Bulgarian": "bg",
                "Catalan": "ca",
                "Cebuano": "ceb",
                "Chichewa": "ny",
                "Chinese (Simplified)": "zh-CN",
                "Chinese (Traditional)": "zh-TW",
                "Corsican": "co",
                "Croatian": "hr",
                "Czech": "cs",
                "Danish": "da",
                "Dutch": "nl",
                "English": "en",
                "Esperanto": "eo",
                "Estonian": "et",
                "Filipino": "tl",
                "Finnish": "fi",
                "French": "fr",
                "Frisian": "fy",
                "Galician": "gl",
                "Georgian": "ka",
                "German": "de",
                "Greek": "el",
                "Gujarati": "gu",
                "Haitian Creole": "ht",
                "Hausa": "ha",
                "Hawaiian": "haw",
                "Hebrew": "iw",
                "Hindi": "hi",
                "Hmong": "hmn",
                "Hungarian": "hu",
                "Icelandic": "is",
                "Igbo": "ig",
                "Indonesian": "id",
                "Irish": "ga",
                "Italian": "it",
                "Japanese": "ja",
                "Javanese": "jw",
                "Kannada": "kn",
                "Kazakh": "kk",
                "Khmer": "km",
                "Kinyarwanda": "rw",
                "Korean": "ko",
                "Kurdish (Kurmanji)": "ku",
                "Kyrgyz": "ky",
                "Lao": "lo",
                "Latin": "la",
                "Latvian": "lv",
                "Lithuanian": "lt",
                "Luxembourgish": "lb",
                "Macedonian": "mk",
                "Malagasy": "mg",
                "Malay": "ms",
                "Malayalam": "ml",
                "Maltese": "mt",
                "Maori": "mi",
                "Marathi": "mr",
                "Mongolian": "mn",
                "Myanmar (Burmese)": "my",
                "Nepali": "ne",
                "Norwegian": "no",
                "Odia (Oriya)": "or",
                "Pashto": "ps",
                "Persian": "fa",
                "Polish": "pl",
                "Portuguese": "pt",
                "Punjabi": "pa",
                "Romanian": "ro",
                "Russian": "ru",
                "Samoan": "sm",
                "Scots Gaelic": "gd",
                "Serbian": "sr",
                "Sesotho": "st",
                "Shona": "sn",
                "Sindhi": "sd",
                "Sinhala": "si",
                "Slovak": "sk",
                "Slovenian": "sl",
                "Somali": "so",
                "Spanish": "es",
                "Sundanese": "su",
                "Swahili": "sw",
                "Swedish": "sv",
                "Tajik": "tg",
                "Tamil": "ta",
                "Tatar": "tt",
                "Telugu": "te",
                "Thai": "th",
                "Turkish": "tr",
                "Turkmen": "tk",
                "Ukrainian": "uk",
                "Urdu": "ur",
                "Uyghur": "ug",
                "Uzbek": "uz",
                "Vietnamese": "vi",
                "Welsh": "cy",
                "Xhosa": "xh",
                "Yiddish": "yi",
                "Yoruba": "yo",
                "Zulu": "zu",
            ]
        ),
        "Bing": translationEngineStruct(
            url: "https://www.translatetheweb.com/?from=&to=%1$@&a=",
            text: "https://www.bing.com/translator?from=&to=%1$@&text=",
            languages: [
                "Afrikaans": "af",
                "Arabic": "ar",
                "Bengali": "bn",
                "Bosnian": "bs",
                "Bulgarian": "bg",
                "Cantonese (Traditional)": "yue",
                "Catalan": "ca",
                "Chinese (Simplified)": "zh-Hans",
                "Chinese (Traditional)": "zh-Hant",
                "Croatian": "hr",
                "Czech": "cs",
                "Danish": "da",
                "Dutch": "nl",
                "English": "en",
                "Estonian": "et",
                "Fijian": "fj",
                "Filipino": "fil",
                "Finnish": "fi",
                "French": "fr",
                "German": "de",
                "Greek": "el",
                "Gujarati": "gu",
                "Haitian Creole": "ht",
                "Hebrew": "he",
                "Hindi": "hi",
                "Hmong": "mww",
                "Hungarian": "hu",
                "Icelandic": "is",
                "Indonesian": "id",
                "Irish": "ga",
                "Italian": "it",
                "Japanese": "ja",
                "Kannada": "kn",
                "Kazakh": "kk",
                "Klingon (Latin)": "tlh-Latn",
                "Klingon (pIqaD)": "tlh-Piqd",
                "Korean": "ko",
                "Latvian": "lv",
                "Lithuanian": "lt",
                "Malagasy": "mg",
                "Malay": "ms",
                "Malayalam": "ml",
                "Maltese": "mt",
                "Maori": "mi",
                "Marathi": "mr",
                "Norwegian": "nb",
                "Persian": "fa",
                "Polish": "pl",
                "Portuguese (Brazil)": "pt",
                "Portuguese": "pt-PT",
                "Punjabi": "pa",
                "Querétaro Otomi": "otq",
                "Romanian": "ro",
                "Russian": "ru",
                "Samoan": "sm",
                "Serbian": "sr-Cyrl",
                "Serbian (Latin)": "sr-Latn",
                "Slovak": "sk",
                "Slovenian": "sl",
                "Spanish": "es",
                "Swahili": "sw",
                "Swedish": "sv",
                "Tahitian": "ty",
                "Tamil": "ta",
                "Telugu": "te",
                "Thai": "th",
                "Tongan": "to",
                "Turkish": "tr",
                "Ukrainian": "uk",
                "Urdu": "ur",
                "Vietnamese": "vi",
                "Welsh": "cy",
                "Yucatec Maya": "yua",
            ]
        ),
        "Yandex": translationEngineStruct(
            url: "https://translate.yandex.com/translate?ui=%1$@&lang=%1$@&url=",
            text: "https://translate.yandex.com/?ui=%1$@&lang=en-%1$@&text=", // TODO: autodetect language
            languages: [
                "Afrikaans": "af",
                "Albanian": "sq",
                "Amharic": "am",
                "Arabic": "ar",
                "Armenian": "hy",
                "Azerbaijani": "az",
                "Bashkir": "ba",
                "Basque": "eu",
                "Belarusian": "be",
                "Bengali": "bn",
                "Bosnian": "bs",
                "Bulgarian": "bg",
                "Catalan": "ca",
                "Cebuano": "ceb",
                "Chinese (Simplified)": "zh",
                "Chuvash": "cv",
                "Croatian": "hr",
                "Czech": "cs",
                "Danish": "da",
                "Dutch": "nl",
                "English": "en",
                "Esperanto": "eo",
                "Estonian": "et",
                "Finnish": "fi",
                "French": "fr",
                "Galician": "gl",
                "Georgian": "ka",
                "German": "de",
                "Greek": "el",
                "Gujarati": "gu",
                "Haitian Creole": "ht",
                "Hebrew": "he",
                "Hill Mari": "mrj",
                "Hindi": "hi",
                "Hungarian": "hu",
                "Icelandic": "is",
                "Indonesian": "id",
                "Irish": "ga",
                "Italian": "it",
                "Japanese": "ja",
                "Javanese": "jv",
                "Kannada": "kn",
                "Kazakh": "kk",
                "Kazakh (Latin)": "kazlat",
                "Khmer": "km",
                "Korean": "ko",
                "Kyrgyz": "ky",
                "Lao": "lo",
                "Latin": "la",
                "Latvian": "lv",
                "Lithuanian": "lt",
                "Luxembourgish": "lb",
                "Macedonian": "mk",
                "Malagasy": "mg",
                "Malay": "ms",
                "Malayalam": "ml",
                "Maltese": "mt",
                "Maori": "mi",
                "Marathi": "mr",
                "Mari": "mhr",
                "Mongolian": "mn",
                "Myanmar (Burmese)": "my",
                "Nepali": "ne",
                "Norwegian": "no",
                "Papiamento": "pap",
                "Persian": "fa",
                "Polish": "pl",
                "Portuguese": "pt",
                "Punjabi": "pa",
                "Romanian": "ro",
                "Russian": "ru",
                "Scots Gaelic": "gd",
                "Serbian": "sr",
                "Sinhala": "si",
                "Slovak": "sk",
                "Slovenian": "sl",
                "Spanish": "es",
                "Sundanese": "su",
                "Swahili": "sw",
                "Swedish": "sv",
                "Tagalog": "tl",
                "Tajik": "tg",
                "Tamil": "ta",
                "Tatar": "tt",
                "Telugu": "te",
                "Thai": "th",
                "Turkish": "tr",
                "Udmurt": "udm",
                "Ukrainian": "uk",
                "Urdu": "ur",
                "Uzbek": "uz",
                "Uzbek (Cyrillic)": "uzbcyr",
                "Vietnamese": "vi",
                "Welsh": "cy",
                "Xhosa": "xh",
                "Yakut": "sah",
                "Yiddish": "yi",
            ]
        ),
    ]
}
