//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Manolo on 14/01/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
        
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                // Currency Icons
                IconGrid(currency: $topCurrency)
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                //Currency icons
                IconGrid(currency: $bottomCurrency)
                
                //Done button
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.cooperPenny), bottomCurrency: .constant(.silverPiece))
}
