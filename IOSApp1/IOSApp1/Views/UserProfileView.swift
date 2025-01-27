import SwiftUI

 

 

 

// User Detail View to display the User and their Order History

struct UserProfile: View {

    var user: User

    

    var body: some View {

        NavigationView {

            ScrollView {

                VStack(alignment: .leading) {

                    // User's name

                    Text(user.name)

                        .font(.largeTitle)

                        .fontWeight(.bold)

                        .padding(.top)

                    

                    // Divider

                    Divider()

                    

                    // Order History Section

                    Text("Order History")

                        .font(.title2)

                        .padding(.top)

                    

                    // List of Coffee Orders

                    if user.orderHistory.isEmpty {

                        Text("No orders yet.")

                            .foregroundColor(.gray)

                            .italic()

                            .padding(.top)

                    } else {

                        ForEach(user.orderHistory) { order in

                            OrderRowView(order: order)  // Custom row for displaying each order

                        }

                    }

                    

                    Spacer()

                }

                .padding()

                .navigationBarTitle("User Details", displayMode: .inline)

                .navigationBarItems(leading: backButton)  // Custom back button (optional)

            }

        }

    }

    

    // Custom Back Button

    private var backButton: some View {

        Button(action: {

            // Handle back action (it'll automatically go back when within NavigationView)

            print("Back button tapped")

        }) {

            Image(systemName: "arrow.left.circle.fill")

                .imageScale(.large)

                .foregroundColor(.blue)

        }

    }

}

 

// Custom Row View for each CoffeeOrder

struct OrderRowView: View {

    var order: CoffeeOrder

    

    var body: some View {

        VStack(alignment: .leading) {

            HStack {

                Text(order.drinkType)

                    .font(.headline)

                Spacer()

                Text(order.size)

                    .font(.subheadline)

                    .foregroundColor(.gray)

            }

            

            Text("Customizations: \(order.customizations.joined(separator: ", "))")

                .font(.body)

                .foregroundColor(.gray)

            

            if !order.notes.isEmpty {

                Text("Notes: \(order.notes)")

                    .font(.body)

                    .italic()

                    .foregroundColor(.blue)

            }

            

            Divider()

        }

        .padding(.vertical)

    }

}

struct UserProfile_Previews: PreviewProvider {

    static var previews: some View {

        let sampleOrders = [

            CoffeeOrder(id: UUID(), name: "John Doe", drinkType: "Latte", size: "Medium", customizations: ["Non-fat Milk", "Extra Shot"], notes: "No Foam"),

            CoffeeOrder(id: UUID(), name: "John Doe", drinkType: "Cappuccino", size: "Large", customizations: ["Oat Milk"], notes: "Extra Hot")

        ]

        

        let sampleUser = User(id: UUID(), name: "John Doe", orderHistory: sampleOrders)

        

        UserProfile(user: sampleUser)

    }

}
