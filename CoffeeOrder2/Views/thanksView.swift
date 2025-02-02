//
//  thanksView.swift
//  CoffeeOrder2
//
//  Created by Fatima Bdair on 2025-02-02.
//

import SwiftUI
struct ThankYouView: View {
    var order: CoffeeOrder

    var body: some View {
        VStack {
            Text("Thank You!")
                .font(.largeTitle)
                .padding()

            Text("Your Order Details:")
                .font(.title2)
                .padding()

            Text("Name: \(order.name)")
            Text("Drink: \(order.coffeeType)")
            Text("Size: \(order.coffeeSize)")
            Text("add Ons: \(order.addOns.joined(separator: ", "))")
            Text("Notes: \(order.specialRequest)")

            Spacer()

            NavigationLink(destination: ContentView()) {
                Text("Order Again")
                    .font(.headline)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
        }
        .padding()
        .navigationTitle("Thank You!")
    }
}

