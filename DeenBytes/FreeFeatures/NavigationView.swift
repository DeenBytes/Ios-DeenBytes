//
//  DrawerMenuView.swift
//  DeenBytes
//
//  Created by Puru Malhotra on 16/07/24.
//

import SwiftUI

struct DrawerMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Profile Section
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("profile_picture") // Replace with actual profile image
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    
                    VStack(alignment: .leading) {
                        Text("Abdul")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("+91 9999 999 999")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    // Handle Edit Profile action
                }) {
                    Text("Edit Profile")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                        .padding(.horizontal)
                }
            }
            .padding(.top, 50)
            .background(Color("MenuHeaderBackground"))
            .cornerRadius(20)
            .padding(.bottom, 20)
            
            // Menu Options
            VStack(alignment: .leading, spacing: 20) {
                MenuOption(imageName: "person.fill", title: "Parental Controls")
                MenuOption(imageName: "location.fill", title: "Location Settings")
                MenuOption(imageName: "doc.text", title: "Terms & Conditions")
                MenuOption(imageName: "lock.shield.fill", title: "Privacy Policy")
                MenuOption(imageName: "info.circle.fill", title: "About this App")
                MenuOption(imageName: "star.fill", title: "Rate this App")
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Social Media Links
            VStack {
                Text("Connect with us")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                HStack(spacing: 20) {
                    SocialMediaLink(imageName: "instagram")
                    SocialMediaLink(imageName: "facebook")
                    SocialMediaLink(imageName: "youtube")
                    SocialMediaLink(imageName: "twitter")
                }
            }
            .padding(.horizontal)
            
            // App Version
            Text("App Version: 4.20.1")
                .foregroundColor(.gray)
                .font(.footnote)
                .padding()
        }
        .padding(.leading, 20)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuOption: View {
    let imageName: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.gray)
                .frame(width: 24, height: 24)
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
    }
}

struct SocialMediaLink: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 30, height: 30)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
    }
}

struct DrawerMenuView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerMenuView()
    }
}
