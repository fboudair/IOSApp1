import SwiftUI

 

 

struct OrderCreationView: View {

    @State private var coffeeOrder = CoffeeOrder(id: UUID(),

                                                 name: "",

                                                 drinkType: "",

                                                 size: "",

                                                 customizations: [],

                                                 notes: "")

    

    @State private var availableSizes = ["Small", "Medium", "Large"]

    @State private var availableDrinkTypes = ["Espresso", "Latte", "Cappuccino", "Americano", "Black Coffee"]

    @State private var availableCustomizations = ["Extra Shot", "Non-fat Milk", "Oat Milk", "Sugar", "No Foam"]

    @State private var showNextPage = false

    var body: some View {

        ZStack {

            // Gradient background (orange to white)

            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.white]),

                           startPoint: .top, endPoint: .bottom)

                .edgesIgnoringSafeArea(.all)  // Make the gradient fill the whole screen

            

            VStack {

                // Customer Info Section

                Section(header: Text("Customer Information").font(.headline)) {

                    TextField("Your Name", text: $coffeeOrder.name)

                        .autocapitalization(.words)

                        .textFieldStyle(RoundedBorderTextFieldStyle())

                }

                .padding(.top)

                

                // Drink Type and Size Picker

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

 

                

                // Customizations Section

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

                

                // Special Notes Section

                Section(header: Text("Special Notes").font(.headline)) {

                    TextField("Any additional notes?", text: $coffeeOrder.notes)

                        .textFieldStyle(RoundedBorderTextFieldStyle())

                        .padding(.vertical)

                }

                

                // Submit Button

                Section {

                    Button(action: {

                        submitOrder()

                    }) {

                        Text("Submit Order")

                            .font(.headline)

                            .frame(maxWidth: .infinity)

                            .padding()

                            .background(Color.white)  // White background for the button

                            .foregroundColor(.black)  // Black text color for the button

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

    }

    

    // Function to handle the order submission

    private func submitOrder() {

        // Here you can perform your submission logic

        print("Order Submitted: \(coffeeOrder)")
        showNextPage = true
        

        // You could save it to a database, send it to an API, or handle the order in another way

        // For example, let's print the order for now

        // You can reset the form or navigate back depending on your needs

    }

}

 

struct OrderCreationView_Previews: PreviewProvider {

    static var previews: some View {

        OrderCreationView()

    }

}
 
