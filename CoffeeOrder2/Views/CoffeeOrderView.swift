//
//  CoffeeOrderView.swift
//  CoffeeOrder2
//
//  Created by Louise Rennick on 2025-01-30.
//

import SwiftUI
import SwiftData
//main coffee order view

struct CoffeeOrderView: View {

    @Environment(\.modelContext) private var context

    @Query private var orders: [CoffeeOrder]

    @State private var showConfirmation = false

    @State private var name = ""

    @State private var selectedSize = "Medium"

    @State private var selectedType = "Espresso"

    @State private var addOns: [String] = []

    @State private var specialRequest = ""

    init(selectedType: String) {
        self._selectedType = State (initialValue: selectedType)
    }

    let coffeeSizes = ["Small", "Medium", "Large"]


    let addOnOptions = ["Milk", "Cream", "Sugar"]

     

    var body: some View {

        NavigationStack {

            VStack {

                ZStack {

                    Color("brown2")

                    VStack(spacing: 20) {

                        Text("☕ Coffee Shop")

                            .font(.largeTitle)

                            .fontWeight(.bold)

                            .padding()

                         

                        TextField("Enter your name", text: $name)

                            .textFieldStyle(RoundedBorderTextFieldStyle())

                            .padding()

                         

                        Picker("Select Size", selection: $selectedSize) {

                            ForEach(coffeeSizes, id: \..self) { size in

                                Text(size)

                            }

                        }

                        .pickerStyle(SegmentedPickerStyle())

                        .padding()

                         
                        
                         

                        Text("Add-Ons")

                            .font(.headline)

                        HStack {

                            ForEach(addOnOptions, id: \..self) { addOn in

                                Button(action: {

                                    if addOns.contains(addOn) {

                                        addOns.removeAll { $0 == addOn }

                                    } else {

                                        addOns.append(addOn)

                                    }

                                }) {

                                    HStack {

                                        Image(systemName: addOns.contains(addOn) ? "checkmark.square.fill" : "square")

                                        Text(addOn)

                                    }

                                }

                                .padding(.horizontal, 5)

                            }

                        }

                         

                        TextField("Special Request", text: $specialRequest)

                            .textFieldStyle(RoundedBorderTextFieldStyle())

                            .padding()

                         

                        Button(action: placeOrder) {

                            HStack {

                                Image(systemName: "cup.and.saucer.fill")

                                Text("Place Order")

                            }

                            .padding()

                            .background(Color.brown)

                            .foregroundColor(.white)

                            .clipShape(RoundedRectangle(cornerRadius: 10))

                        }

                    }

                    .padding()

                }

                 

                // Order List

                List {

                    ForEach(orders) { order in

                        VStack(alignment: .leading) {

                            Text("Order for: \(order.name)")

                                .font(.headline)

                            Text("Size: \(order.coffeeSize)")

                            Text("Type: \(order.coffeeType)")

                            Text("Add-Ons: \(order.addOns.joined(separator: ", "))")

                            Text("Special Request: \(order.specialRequest)")

                                .italic()

                        }

                    }

                    .onDelete(perform: deleteOrder)

                }

                .navigationTitle("Orders")
                NavigationLink(destination: ThankYouView(order: CoffeeOrder(name: name, coffeeSize: selectedSize, coffeeType: selectedType, addOns: addOns, specialRequest: specialRequest)), isActive: $showConfirmation) {
                    EmptyView()
                }

                               }

        }

    }

     

    //Place Order

    private func placeOrder() {

        guard !name.isEmpty else { return }

        let newOrder = CoffeeOrder(name: name, coffeeSize: selectedSize, coffeeType: selectedType, addOns: addOns, specialRequest: specialRequest)

        context.insert(newOrder)

        //name = ""
        showConfirmation = true
        //specialRequest = ""

        //addOns = []

    }

     

    // Delete Order

    private func deleteOrder(at offsets: IndexSet) {

        for index in offsets {

            context.delete(orders[index])

        }

    }

}

  



#Preview {

    CoffeeOrderView(selectedType:"Latte")

        .modelContainer(for: CoffeeOrder.self, inMemory: true)

}

 
