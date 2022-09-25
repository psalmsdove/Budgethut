//
//  BudgethutApp.swift
//  Budgethut
//
//  Created by Ali Erdem Kökcik on 25.09.2022.
//

import SwiftUI

@main
struct BudgethutApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
