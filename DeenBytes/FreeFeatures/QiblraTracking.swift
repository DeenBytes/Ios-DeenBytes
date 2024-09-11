//
//  QiblraTracking.swift
//  DeenBytes
//
//  Created by Puru Malhotra on 11/07/24.
//

import SwiftUI

struct QiblaFinderView: View {
    var body: some View {
        VStack {
            // Navigation bar with title and back button
            HStack {
                Button(action: {
                    // Action for back button
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Qibla Finder")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                Spacer()
                // Empty space to align the title in the center
                Image(systemName: "ellipsis")
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            
            Spacer()
            
            // Infinity symbol image
            Image("infinitySymbol") // Replace with your image name
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                        
            Spacer()
            
            // Instructional text
            Text("Please Calibrate your device’s compass by making figure 8 as shown above. Tilt and move for 3 times")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
            
            // Continue button
            Button(action: {
                // Action for continue button
            }) {
                Text("Continue")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryGreen)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct QiblaFinderView_Previews: PreviewProvider {
    static var previews: some View {
        QiblaFinderView()
    }
}

