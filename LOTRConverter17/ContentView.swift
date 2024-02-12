//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Manolo on 06/01/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false // Initialize with false the status of the sheet to change the currency
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var rigthTyping
    @FocusState var leftTyping
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    var body: some View {
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                // Superior Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Currency conversion section
                HStack{
                    // Left  conversion section
                    VStack{
                        // Currency
                        HStack{
                            //Currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5) // Modifiers
                        .onTapGesture { // Code that runs when the area is pressed
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                        
                        // Textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                    }
                    // Equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right conversion section
                    VStack{
                        // Currency
                        HStack{
                            // Currency text
                            Text(rightCurrency.name) // takes name from currency
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(rightCurrency.image) // takes image value
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5) // Modifiers
                        .onTapGesture { // Code that runs when the area is pressed
                            showSelectCurrency.toggle()
                        }
                        
                        
                        // Textfield
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rigthTyping)
                            .keyboardType(.decimalPad)
                    }
                }
                
                Spacer()
                
                HStack {
                    Button{
                        showExchangeInfo.toggle()
                    } label:{
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping{
                rightAmount =
                leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rigthTyping{
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency, {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        })
        .onChange(of: rightCurrency, {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        })
        .sheet(isPresented: $showExchangeInfo){ // sheet que abre la pagina de mostrar exchange info
            ExchangeView()
        }
        .sheet(isPresented: $showSelectCurrency){
            SelectCurrency(topCurrency: $leftCurrency,
                           bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
