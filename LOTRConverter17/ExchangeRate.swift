import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let textEquals: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            // Left currency image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            
            
            // Exchange rate text
            Text(textEquals)
            
            
            // Right currency image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}
#Preview {
    ExchangeRate(leftImage: .goldpenny, textEquals: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}
