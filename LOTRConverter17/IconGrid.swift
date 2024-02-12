//
//  IconGrid.swift
//  LOTRConverter17
//
//  Created by Manolo on 15/01/24.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
            ForEach(Currency.allCases){ currency in
                if self.currency == currency{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }else{
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
                
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPiece))
}
