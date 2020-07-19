//
//  ViewController.swift
//  One Click Translate for Safari
//
//  Created by user on 7/19/20.
//  Copyright © 2020 Dmitry Rodin. All rights reserved.
//

import Cocoa
import SafariServices.SFSafariApplication

class ViewController: NSViewController {

    @IBOutlet weak var engine: NSPopUpButton!
    @IBOutlet weak var language: NSPopUpButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateEngines()
        self.updateLanguages()
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        SFSafariApplication.showPreferencesForExtension(withIdentifier: "com.drodin.Free-Translate-for-Safari.Extension") { error in
            if let _ = error {
                // Insert code to inform the user that something went wrong.

            }
        }
    }

    @IBAction func engineSelected(_ sender: NSPopUpButton) {
        Preference.engine = sender.selectedItem!.title
        self.updateLanguages()
    }

    @IBAction func languageSelected(_ sender: NSPopUpButton) {
        Preference.language = sender.selectedItem!.title
    }

    func updateEngines() {
        self.engine.removeAllItems();
        self.engine.addItems(withTitles: Array(Preference.translationEngines.keys).sorted())
        self.engine.selectItem(withTitle: Preference.engine)
    }

    func updateLanguages() {
        self.language.removeAllItems()
        self.language.addItems(withTitles: Array(Preference.translationLanguages.keys).sorted())
        self.language.selectItem(withTitle: Preference.language)
    }
}
