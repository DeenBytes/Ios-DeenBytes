import SwiftUI

struct EditProfileView: View {
    @State private var fullName: String = "Abdul Khan"
    @State private var mobileNumber: String = "+91 9999 999 999"
    @State private var email: String = ""
    @State private var location: String = ""
    @State private var showDeletionSheet: Bool = false
    @State private var confirmationText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Profile Image
                ZStack {
                    Image("profile_picture")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .offset(y:-32)
                    // Edit Icon
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .offset(x: 35, y: 3)
                }
                .padding(.top, 20)
                
                // Full Name
                TextField("Full Name", text: $fullName)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // Mobile Number
                TextField("Mobile No.", text: $mobileNumber)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // Email
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // Location
                TextField("Location", text: $location)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                // Save Changes Button
                Button(action: {
                    // Save changes action
                }) {
                    Text("Save Changes")
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.primaryGreen)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Delete Account Button
                Button(action: {
                    showDeletionSheet = true
                }) {
                    HStack {
                        Image(systemName: "trash")
                        Text("Delete Account Permanently")
                    }
                    .foregroundColor(.red)
                }
                .padding(.top, 20)
                
                // Logout Button
                Button(action: {
                    // Logout action
                }) {
                    HStack {
                        Image(systemName: "arrow.right.square")
                        Text("Logout")
                    }
                    .foregroundColor(.black)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Edit Profile")
                        .font(.system(size: 24, weight: .bold))
                }
            }
            .navigationBarItems(leading: Button(action: {
                // Back action
            }) {
                Image(systemName: "arrow.left")
            })
            .sheet(isPresented: $showDeletionSheet) {
                AccountDeletionSheet(confirmationText: $confirmationText)
            }
        }
    }
}

struct AccountDeletionSheet: View {
    @Binding var confirmationText: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Account Deletion")
                .font(.title)
                .fontWeight(.bold)
            
            Text("We are sorry to see you leaving")
                .font(.subheadline)
                .foregroundColor(.primaryGreen)
            
            Text("""
                Account cancellation is final and irreversible. All your content, including profile, count, bookmarks, and history, will be permanently deleted. If unsure, please contact support.
                """)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("To confirm deletion, type “Delete” below")
                .font(.footnote)
                .foregroundColor(.gray)
            
            TextField("Type delete here", text: $confirmationText)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)
            
            Button(action: {
                // Delete account action
            }) {
                Text("Delete Account Anyway")
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.primaryGreen)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Button(action: {
                // Keep account action
            }) {
                Text("Keep Account")
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

