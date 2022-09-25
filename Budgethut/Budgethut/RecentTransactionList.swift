//
//  RecentTransactionList.swift
//  Budgethut
//
//  Created by Ali Erdem Kökcik on 25.09.2022.
//

import SwiftUI
import SwiftUIFontIcon

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                NavigationLink{
                    
                } label: {
                    HStack(spacing: 4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element){index, transaction in
                TransactionRow(transaction: transaction)
                Divider()
                    .opacity(index == 4 ? 0 : 1)
                
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(radius: 8)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        RecentTransactionList()
            .environmentObject(transactionListVM)
    }
}
