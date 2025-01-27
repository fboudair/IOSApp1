
import SwiftUI
struct ContentView: View {

    //change the background colour

    var body: some View {

        NavigationView {

                    ZStack {


                        LinearGradient(gradient: Gradient(colors: [Color.orange, Color.white]),

                                       startPoint: .top, endPoint: .bottom)

                            .edgesIgnoringSafeArea(.all)  // Make the gradient fill the whole screen

 

                        VStack {

                            Image(systemName: "cup.and.saucer")

                                .imageScale(.large)

                                .foregroundColor(Color(red: 0.6, green: 0.3, blue: 0.1))  // Brown color for the image

                            

                            Text("Coffee Run")

                                .font(.largeTitle)

                                .foregroundColor(.white)

                            NavigationLink(destination: OrderCreationView()) {

                                Text("Start Order")

                                    .font(.title)

                                    .padding()

                                    .background(Color.white)

                                    .foregroundColor(.black)

                                    .cornerRadius(10)

                                    .shadow(radius: 10)

                            }

                        }

                        .padding()

                    }

                }

            }

        }

 

#Preview {

    ContentView()

}
struct CoffeeOrder: Identifiable {
var id: UUID
var name: String
var drinkType: String
var size: String
var customizations: [String]
var notes: String
}
struct User: Identifiable {
var id: UUID
var name: String
var orderHistory: [CoffeeOrder]
}
import SwiftUI

struct OrderCreationView: View {
    @State private var coffeeOrder = CoffeeOrder(
        id: UUID(),
        name: "",
        drinkType: "",
        size: "",
        customizations: [],
        notes: ""
    )

    @State private var availableSizes = ["Small", "Medium", "Large"]
    @State private var availableDrinkTypes = ["Espresso", "Latte", "Cappuccino", "Americano", "Black Coffee"]
    @State private var availableCustomizations = ["Extra Shot", "Non-fat Milk", "Oat Milk", "Sugar", "No Foam"]
    
    @State private var navigateToThankYou = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orange, Color.white]),
                               startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Section(header: Text("Customer Information").font(.headline)) {
                        TextField("Your Name", text: $coffeeOrder.name)
                            .autocapitalization(.words)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.top)

                    Section(header: Text("Drink Information").font(.headline)) {
                        Picker("Select Drink Type", selection: $coffeeOrder.drinkType) {
                            ForEach(availableDrinkTypes, id: \.self) { drink in
                                Text(drink)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Picker("Select Size", selection: $coffeeOrder.size) {
                            ForEach(availableSizes, id: \.self) { size in
                                Text(size)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    Section(header: Text("Customizations").font(.headline)) {
                        ForEach(availableCustomizations, id: \.self) { customization in
                            Toggle(customization, isOn: Binding(
                                get: { coffeeOrder.customizations.contains(customization) },
                                set: { isOn in
                                    if isOn {
                                        coffeeOrder.customizations.append(customization)
                                    } else {
                                        coffeeOrder.customizations.removeAll { $0 == customization }
                                    }
                                }
                            ))
                        }
                    }

                    Section(header: Text("Special Notes").font(.headline)) {
                        TextField("Any additional notes?", text: $coffeeOrder.notes)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical)
                    }

                    Section {
                        Button(action: {
                            submitOrder()
                        }) {
                            Text("Submit Order")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                        .padding(.top)
                    }
                }
                .padding()
            }
            .navigationTitle("Create Your Coffee Order")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $navigateToThankYou) {
                ThankYouView(order: coffeeOrder)
            }
        }
    }

    private func submitOrder() {
        print("Order Submitted: \(coffeeOrder)")
        navigateToThankYou = true
    }
}

 

struct OrderCreationView_Previews: PreviewProvider {

    static var previews: some View {

        OrderCreationView()

    }

}


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
            Text("Drink: \(order.drinkType)")
            Text("Size: \(order.size)")
            Text("Customizations: \(order.customizations.joined(separator: ", "))")
            Text("Notes: \(order.notes)")

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
