//
//  User.swift
//  DummyJsonUserApi
//
//  Created by Mac on 05/04/23.
//

import Foundation
struct Root : Codable{
    let users : [User]
}
struct User: Codable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender: Gender
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
    let eyeColor: EyeColor
    let hair: Hair
    let domain, ip: String
    let address: Address
    let macAddress, university: String
    let bank: Bank
    let company: Company
    let ein, ssn, userAgent: String
}

// mark : address
struct Address: Codable {
    let address: String
    let city: String?
    let coordinates: Coordinates
    let postalCode, state: String
}
// mark: coordinates
struct Coordinates: Codable {
    let lat, lng: Double
}
//mark company
struct Bank: Codable {
    let cardExpire, cardNumber, cardType, currency: String
    let iban: String
}

//mark : company
struct Company: Codable {
    let address: Address
    let department, name, title: String
}

enum EyeColor: String, Codable {
    case amber = "Amber"
    case blue = "Blue"
    case brown = "Brown"
    case gray = "Gray"
    case green = "Green"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}
//mark : Hair
struct Hair: Codable {
    let color: Color
    let type: TypeEnum
}

enum Color: String, Codable {
    case auburn = "Auburn"
    case black = "Black"
    case blond = "Blond"
    case brown = "Brown"
    case chestnut = "Chestnut"
}

enum TypeEnum: String, Codable {
    case curly = "Curly"
    case straight = "Straight"
    case strands = "Strands"
    case veryCurly = "Very curly"
    case wavy = "Wavy"
}
