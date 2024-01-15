//
//  SelectCurrency.swift
//  LOTRConverter17
//
//  Created by Manolo on 14/01/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
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
                ZStack(alignment: .bottom){
                    Image(.copperpenny)
                        .resizable()
                        .scaledToFit()
                    
                    Text("Cooper Penny")
                        .padding(3)
                        .font(.caption)
                        .frame(maxWidth:.infinity)
                        .background(.brown.opacity(0.75))
                }
                .padding(3)
                .frame(width: 100, height: 100)
                .background(.brown)
                .clipShape(.rect(cornerRadius: 25))
                
                //Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                
                //Currency icons
                
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
    SelectCurrency()
}
