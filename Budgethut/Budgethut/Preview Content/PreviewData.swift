//
//  PreviewData.swift
//  Budgethut
//
//  Created by Ali Erdem Kökcik on 25.09.2022.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "09/25/2022", institution: "Ali", account: "Visa Ali", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
