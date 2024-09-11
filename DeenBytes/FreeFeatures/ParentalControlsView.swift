import SwiftUI

struct ParentalControlsView: View {
    @State private var concernText: String = ""
    @State private var opinionText: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            // Custom header
            HStack {
                Button(action: {
                    // Action for back button
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Parental Controls")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    // Action for ellipsis button
                }) {
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            .padding()
            .background(Color.white) // Optional: Set a background color for the header
            
            ScrollView {
                VStack(spacing: 20) { // Added spacing between elements
                    // Kids learning progress
                    VStack(alignment: .leading, spacing: 10) { // Added spacing within the VStack
                        HStack {
                            Text("Kids learning progress")
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                // View all action
                            }) {
                                Text("View all")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        Text("Overall Outcome")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        ProgressView(value: 0.5)
                            .progressViewStyle(LinearProgressViewStyle(tint: Color.green))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 24).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    
                    // Raise a concern
                    VStack(alignment: .leading, spacing: 10) { // Added spacing within the VStack
                        Text("Raise a concern")
                            .font(.headline)
                        Text("Overall Outcome")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        TextEditor(text: $concernText)
                            .frame(height: 100)
                            .background(Color.white)
                            .cornerRadius(24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Button(action: {
                            // Send action
                        }) {
                            Text("Send")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(24)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 24).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    
                    // Post your opinion
                    VStack(alignment: .leading, spacing: 10) { // Added spacing within the VStack
                        Text("Post your opinion")
                            .font(.headline)
                        Text("Overall Outcome")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        TextEditor(text: $opinionText)
                            .frame(height: 100)
                            .background(Color.white)
                            .cornerRadius(24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        Button(action: {
                            // Send action
                        }) {
                            Text("Send")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(24)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 24).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                    
                    // Connect with us
                    HStack {
                        Spacer()
                        Button(action: {
                            // Instagram action
                        }) {
                            Image("instagram")
                                .font(.title)
                                .foregroundColor(.purple)
                        }
                        Spacer()
                        Button(action: {
                            // Facebook action
                        }) {
                            Image("facebook")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        Spacer()
                        Button(action: {
                            // YouTube action
                        }) {
                            Image("youtube")
                                .font(.title)
                                .foregroundColor(.red)
                        }
                        Spacer()
                        Button(action: {
                            // Twitter action
                        }) {
                            Image("twitter")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 24).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
                }
                .padding(.vertical) // Added vertical padding to the main VStack
            }
        }
    }
}

struct ParentalControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ParentalControlsView()
    }
}
