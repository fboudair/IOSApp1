//
//  ContentView.swift
//  CoffeeOrder2
//
//  Created by Louise Rennick on 2025-01-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // background color
                Image("coffee2")
                
                   // .ignoresSafeArea()
                //lightbrown color Assest
                
                // centre button to navigate
                VStack {
                    Spacer()
                    Text ("Coffee so good, \nyour taste buds \nwill love it.")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth:.infinity)
                    NavigationLink(destination: menuView()) {
                        Text("Get Started")
                            .font(.title)
                            .padding(10)
                            .background(Color("brown"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top,200)
                    Spacer()
                   
                }
                .padding()
                
            }
            .edgesIgnoringSafeArea(.all)
            //make sure the background covers the whole screen
           // .navigationTitle(Text("Coffee Shop"))
            .toolbar {
                ToolbarItem (placement: .principal) {
                    Text ("LULU COFFEE SHOP").foregroundColor (.white) .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
            
            
        }
       
    }
}

#Preview {
    ContentView()
}
