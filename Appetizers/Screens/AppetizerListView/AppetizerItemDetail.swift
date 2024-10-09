//
//  AppetizerItemDetail.swift
//  Appetizers
//
//  Created by Apple on 09/10/2024.
//

import SwiftUI

struct AppetizerItemDetail : View {
    
    var appetizer:Appetizer
    
    @Binding var isModalShowing : Bool
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        ZStack{
            VStack(alignment:.center){
                AppetizerRemoteImage(fromURLString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                
                
                Text(appetizer.name)
                    .bold()
                    .font(.system(size: 20))
                
                
                Spacer()
                    .frame(height: 20)
                
                
                Text(appetizer.description)
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 30)
                
                HStack(spacing:40){
                    VStack{
                        Text("Calories")
                            .bold()
                            .font(.system(size: 15))
                        
                        
                        Spacer()
                            .frame(height: 10)
                        
                        
                        Text("\(appetizer.calories)")
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                            .italic()
                            .foregroundStyle(.gray)
                    }
                    
                    VStack{
                        Text("Carbs")
                            .bold()
                            .font(.system(size: 15))
                        
                        
                        Spacer()
                            .frame(height: 10)
                        
                        
                        Text("\(appetizer.carbs) g")
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                            .italic()
                            .foregroundStyle(.gray)
                    }
                    
                    VStack{
                        Text("Protein")
                            .bold()
                            .font(.system(size: 15))
                        
                        
                        Spacer()
                            .frame(height: 10)
                        
                        
                        Text("\(appetizer.protein) g")
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                            .italic()
                            .foregroundStyle(.gray)
                    }
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("$ \(appetizer.price,specifier: "%0.2f") - Add To Order")
                        .foregroundColor(.white)  // Use foregroundColor for text color
                        .frame(maxWidth: .infinity, minHeight: 50)  // Set width and height
                    
                }
                .background(Color.brandPrimary)  // Background color applied to the entire frame
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .padding(.bottom,20)
                
            }
            
        }
        
        .frame(width: 300,height: 500)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 20)
        .overlay(
            Button(action: {
                isModalShowing = false
            }) {
                Image(systemName: "xmark")
                    .foregroundStyle(.black)
                    .padding(10)
                    .background(Color.white)
                    .opacity(0.8)
                    .clipShape(Circle())
                    .shadow(radius: 3)
            }
                .padding(5),
            alignment: .topTrailing
        )
    }
    
}
