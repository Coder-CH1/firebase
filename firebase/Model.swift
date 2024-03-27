//
//  Model.swift
//  firebase
//
//  Created by Mac on 22/03/2024.
//

import Foundation
import FirebaseFirestore

protocol FirebaseDetails {
}

struct AboutMe : FirebaseDetails{
    var gender: String
    var name: String
    var stack: String

    init(document: DocumentSnapshot) {
        self.gender = document.get("titleGender") as? String ?? ""
        self.name = document.get("titleName") as? String ?? ""
        self.stack = document.get("titleStack") as? String ?? ""
    }
}

struct AboutCountry : FirebaseDetails{
    var country: String
    var president: String
    var race: String

    init(document: DocumentSnapshot) {
        self.country = document.get("titleCountry") as? String ?? ""
        self.president = document.get("titlePresident") as? String ?? ""
        self.race = document.get("titleRace") as? String ?? ""
    }
}

struct AboutState : FirebaseDetails{
    var gov: String
    var state: String
    var zone: String

    init(document: DocumentSnapshot) {
        self.gov = document.get("titleGovernor") as? String ?? ""
        self.state = document.get("titleState") as? String ?? ""
        self.zone = document.get("titleZone") as? String ?? ""
    }
}

struct AboutAnimal : FirebaseDetails{
    var animal: String
    var color: String
    var laptop: String

    init(document: DocumentSnapshot) {
        self.animal = document.get("titleAnimal") as? String ?? ""
        self.color = document.get("titleColor") as? String ?? ""
        self.laptop = document.get("titleLaptop") as? String ?? ""
    }
}

struct AboutFruit : FirebaseDetails{
    var color: String
    var fruit: String
    var shape: String

    init(document: DocumentSnapshot) {
        self.color = document.get("titleColor") as? String ?? ""
        self.fruit = document.get("titleFruit") as? String ?? ""
        self.shape = document.get("titleShape") as? String ?? ""
    }
}

    struct AboutRandom : FirebaseDetails{
        var firstName: String
        var phoneBrand: String
        var socialMedia: String

        init(document: DocumentSnapshot) {
            self.firstName = document.get("titleName") as? String ?? ""
            self.phoneBrand = document.get("titlePhoneBrand") as? String ?? ""
            self.socialMedia = document.get("titleSocialMedia") as? String ?? ""
        }
    }

struct AboutNumOne: FirebaseDetails {
    var num1: String
    var num2: String
    var num3: String
    
    init(document: DocumentSnapshot) {
        self.num1 = document.get("num1") as? String ?? ""
        self.num2 = document.get("num2") as? String ?? ""
        self.num3 = document.get("num3")as? String ?? ""
    }
}

struct AboutNumTwo: FirebaseDetails {
    var num4: String
    var num5: String
    var num6: String
    
    init(document: DocumentSnapshot) {
        self.num4 = document.get("num4") as? String ?? ""
        self.num5 = document.get("num5") as? String ?? ""
        self.num6 = document.get("num6")as? String ?? ""
    }
}

struct AboutNumThree: FirebaseDetails {
    var num9: Int
    var lastName: String
    var num8: String

    init(document: DocumentSnapshot) {
        self.num9 = document.get("num9") as? Int ?? 0
        self.lastName = document.get("lastName") as? String ?? ""
        self.num8 = document.get("num8")as? String ?? ""
    }
}





