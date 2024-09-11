import SwiftUI

struct OTPVerificationView: View {
    @State private var otp = ["", "", "", "", "", ""]
    @State private var timeRemaining = 24
    @State private var isTimerActive = true

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
                        Text("OTP Verification")
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
            
            VStack(spacing:10){
                // Instruction Text
                Text("We will send you one-time password to your mobile number")
                    .font(.subheadline)
                    .foregroundColor(Color(hex: "237B70"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                
                // OTP Input Fields
                HStack(spacing: 10) {
                    ForEach(0..<6) { index in
                        TextField("", text: $otp[index])
                            .frame(width: 50, height: 50)
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .background(RoundedRectangle(cornerRadius: 8).stroke(Color(hex: "237B70"), lineWidth: 1))
                            .keyboardType(.numberPad)
                    }
                }
                .padding(.top, 20)
                
                // Continue Button
                Button(action: {
                    // Handle Continue action
                }) {
                    Text("Continue")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(hex: "237B70"))
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                        .padding(.top, 30)
                }
                
                // Resend OTP Text
                if isTimerActive {
                    Text("Didn't receive the OTP? Resend (in \(timeRemaining)s)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                } else {
                    Button(action: {
                    startTimer()
                        // Handle Resend OTP action
                    }) {
                        Text("Resend OTP")
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .padding(.top, 10)
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(CurvedShapeNew()
                .fill(Color.white))
            .offset(y: -40)
  
        }
        .onAppear(perform: startTimer)
    }

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                isTimerActive = false
                timer.invalidate()
            }
        }
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView()
    }
}
