//
//  MainDocument.swift
//  ContactApp-Murzaliev
//
//  Created by Samat Murzaliev on 16.02.2022.
//

import Foundation


class MainDocument {
 
    private var userDefaults = UserDefaults.standard
    public var contacts: [String] = UserDefaults.standard.stringArray(forKey: "allcontacts") ?? []
    
    func saveContact(nameNumber: String) {
        contacts.insert(nameNumber, at: 0)
        userDefaults.set(contacts, forKey: "allcontacts")
    }
    
    func updateContacts() {
        contacts = userDefaults.stringArray(forKey: "allcontacts")!
    }    
}
