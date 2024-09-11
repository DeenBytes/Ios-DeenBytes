import SwiftUI

struct LocationSettingsView: View {
    @State private var selectedInstitution = "University of Islamic Sciences, Karachi"
    @State private var selectedJuristicMethod = "Standard"
    
    let institutions = ["University of Islamic Sciences, Karachi","Islamic Society of North America","Muslim World League","Umm Al-Qura University, Makkah"]
    let juristicMethods = ["Standard", "Hanafi"]
    
    var body: some View {
        VStack() {
            // Custom Navigation Bar
            HeaderViewLocation()
            
            VStack(alignment: .center, spacing: 20){
                // Location Box
                HStack {
                    Image(systemName: "location.fill")
                        .foregroundColor(.green)
                    VStack(alignment: .leading) {
                        Text("Your Location")
                            .font(.headline)
                        Text("B-9, Sector 64, Meerut Division, India")
                            .font(.subheadline)
                    }
                    Spacer()
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(24)
                
                // Institution Picker
                Picker(selection: $selectedInstitution, label: Text("University of Islamic Sciences, Karachi")) {
                    ForEach(institutions, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(24)
                
                // Juristic Method
                Text("Juristic Method")
                    .font(.headline)
                Text("Please select your preferred jurisprudence")
                    .font(.subheadline)
                
                VStack {
                    ForEach(juristicMethods, id: \.self) { method in
                        HStack {
                            Image(systemName: selectedJuristicMethod == method ? "largecircle.fill.circle" : "circle")
                                .onTapGesture {
                                    selectedJuristicMethod = method
                                }
                            Text(method == "Standard" ? "Standard (Shafi, Hanbali, Maliki)" : method)
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(24)
                    }
                }
                
                Spacer()
                
                // Continue Button
                Button(action: {
                    // Handle continue action
                }) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(24)
                }
            }
            .padding()
        }
    }


    struct HeaderViewLocation: View {
        var body: some View {
            HStack {
                Button(action: {
                    // Action for back button
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Location Settings")
                    .font(.headline)
                Spacer()
               
            }
     
            .padding(.bottom, 24)
            .padding(.horizontal, 24)
            .background(Color.white)
            .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 2)
        }

            }
}


struct LocationSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSettingsView()
    }
}
