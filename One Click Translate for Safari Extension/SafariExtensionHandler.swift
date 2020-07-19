//
//  SafariExtensionHandler.swift
//  One Click Translate for Safari Extension
//
//  Created by user on 7/19/20.
//  Copyright © 2020 Dmitry Rodin. All rights reserved.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {
    
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
}
