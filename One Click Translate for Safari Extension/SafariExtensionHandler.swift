//
//  SafariExtensionHandler.swift
//  One Click Translate for Safari Extension
//
//  Created by user on 7/19/20.
//  Copyright © 2020 Dmitry Rodin. All rights reserved.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
    override func validateContextMenuItem(withCommand command: String, in page: SFSafariPage, userInfo: [String : Any]? = nil, validationHandler: @escaping (Bool, String?) -> Void) {
        if command == "TranslateText" && (
            userInfo == nil || userInfo!["selectedText"] == nil || !(userInfo!["selectedText"] is String) || userInfo!["selectedText"] as! String == "") {
                validationHandler(true, nil)
        }
    }
    
    override func contextMenuItemSelected(withCommand command: String, in page: SFSafariPage, userInfo: [String : Any]? = nil) {
        switch command {
        case "TranslatePage":
            page.getContainingTab { tab in
                tab.getContainingWindow { window in
                    self.toolbarItemClicked(in: window!)
                }
            }
            
        case "TranslateText":
            page.getContainingTab { tab in
                tab.getContainingWindow { window in
                    window?.openTab(with: self.translateText(text: userInfo!["selectedText"] as! String), makeActiveIfPossible: true, completionHandler: { _ in
                        // Tab opened
                    })
                }
            }

        default:
            break;
        }
    }
    
    override func toolbarItemClicked(in window: SFSafariWindow) {
        // This method will be called when your toolbar item is clicked.
        window.getActiveTab { tab in
            tab?.getActivePage { page in
                page?.getPropertiesWithCompletionHandler { properties in
                    tab?.navigate(to: self.translateURL(url: properties?.url))
        }}}
    }
    
    override func validateToolbarItem(in window: SFSafariWindow, validationHandler: @escaping ((Bool, String) -> Void)) {
        // This is called when Safari's state changed in some way that would require the extension's toolbar item to be validated again.
        validationHandler(true, "")
    }

    func translateURL(url: URL?) -> URL {
        let encodedURL = url?.absoluteString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)

        return URL(string: Preference.translationUrl + encodedURL!)!
    }

    func translateText(text: String) -> URL {
        let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)

        return URL(string: Preference.translationText + encodedText!)!
    }
}
