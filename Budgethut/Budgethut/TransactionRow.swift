//
//  TransactionRow.swift
//  Budgethut
//
//  Created by Ali Erdem Kökcik on 25.09.2022.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.4))
                .frame(width: 45, height: 50)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 18, color: Color.icon)
                }
            VStack(alignment: .leading, spacing: 6){
                Text(transaction.merchant)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .lineLimit(1)
                
                Text(transaction.category)
                    .font(.subheadline)
                    .lineLimit(1)
                
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            
            Spacer()
            
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text: .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData)
    }
}
