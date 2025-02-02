//
//  menuvView.swift
//  CoffeeOrder2
//
//  Created by Fatima Bdair on 2025-02-02.
//

import SwiftUI

struct menuView: View {
    let menu =  [
        ("Latte", "latte", 2.99),
        ("Expresso", "expresso", 2.49),
        ("Mocha", "mocha", 3.49),
        ("Frappuchino", "frappuchino", 4.99)
    ]
    var body: some View {
        List (menu, id:\.0) {
            coffee in NavigationLink (destination: CoffeeOrderView (selectedType: coffee.0)) {
                HStack {
                    Image(coffee.1)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape((Circle()))
                        .padding(.trailing)
                    VStack(alignment: .leading)
                    {
                        Text(coffee.0)
                            .font(.headline)
                        Text(String(format: "$%.2f", coffee.2))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }
                .padding(.vertical,5)
            }
        }
        .navigationTitle("Menu")
    }
}
#Preview {
    NavigationStack {
        menuView()
    }
}
