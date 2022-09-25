//
//  TransactionModel.swift
//  Budgethut
//
//  Created by Ali Erdem Kökcik on 25.09.2022.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date{
        date.dateParsed()
    }
    
    var signedAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
}

enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}

struct Category{
    let id: Int
    let name: String
    var mainCategoryId: Int?
}

extension Category{
    static let categories: [Category] = [
            .autoAndTransport,
            .billsAndUtilities,
            .entertainment,
            .feesAndCharges,
            .foodAndDining,
            .home,
            .income,
            .shopping,
            .transfer,
    ]
    static let subCategories: [Category] = [
            .publicTransportation,
            .taxi,
            .mobilePhone,
            .moviesAndDVDs,
            .bankFee,
            .financeCharge,
            .groceries,
            .restaurants,
            .rent,
            .homeSupplies,
            .paycheque,
            .software,
            .creditCardPayment,
    ]
    
    static let all: [Category] = categories + subCategories
}


extension Category{
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport")
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities")
    static let entertainment = Category(id: 3, name: "Entertainment")
    static let feesAndCharges = Category(id: 4, name: "Fees&Charges")
    static let foodAndDining = Category(id: 5, name: "Food & Dining")
    static let home = Category(id: 6, name: "Home")
    static let income = Category(id: 7, name : "Income")
    static let shopping = Category(id: 8, name: "Shopping")
    static let transfer = Category(id: 9, name: "Transfer")
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment" , mainCategoryId: 9)
}

