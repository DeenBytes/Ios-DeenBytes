import SwiftUI

struct SignUpView: View {
    @State private var phoneNumber: String = ""
    @State private var selectedCountryCode: String = "+91" // Default country code
    @State private var showCountryCodes: Bool = false // State to control the dropdown menu

    let countryCodes = ["+1", "+44", "+91", "+61", "+81", "+86"] // Example list of country codes

    var body: some View {
        VStack {
            // Background Image
            Image("loginImage") // Replace with your background image name
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(height: 250)
                .overlay(
                    VStack {
                        Text("Welcome")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("Unified Approach to your learning")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "237B70"))
                    }
                    .padding(.top, 50)
                    .offset(y: -70)
                )
            
            // Form Section
            VStack(spacing: 20) {
                Text("Create your Account")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack {
                    // Country Code Dropdown
                    Menu {
                        ForEach(countryCodes, id: \.self) { code in
                            Button(action: {
                                selectedCountryCode = code
                            }) {
                                Text(code)
                            }
                        }
                    } label: {
                        HStack {
                            Image(systemName: "flag.fill")
                            Text(selectedCountryCode)
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                        .padding(.horizontal, 5)
                        .frame(width: 100, height: 55)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(24)
                    }
                    
                    // Mobile Number Input
                    TextField("Mobile number", text: $phoneNumber)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(24)
                        .keyboardType(.numberPad)
                }
                
                // Continue Button
                Button(action: {
                    // Action for Continue
                }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "237B70"))
                        .cornerRadius(24)
                }
                
                // Or Divider
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    
                    Text("Or")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                }
                
                // Google and Email Buttons
                Button(action: {
                    // Action for Google Login
                }) {
                    HStack {
                        Image(systemName: "g.circle")
                        Text("Continue with Google")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(24)
                }
                
                Button(action: {
                    // Action for Email Login
                }) {
                    HStack {
                        Image(systemName: "envelope.fill")
                        Text("Continue with Email")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(24)
                }
            }
            .padding()
            .background(CurvedShapeNew()
                .fill(Color.white))
            .offset(y: -40)
            
            // Sign in Link
            Spacer()
            HStack {
                Text("Already have an account?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Button(action: {
                    // Action for Sign In
                }) {
                    Text("Sign in")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
