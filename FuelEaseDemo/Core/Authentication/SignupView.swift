import SwiftUI

struct Signup: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var phoneNumber = ""
    @State private var primaryLocation = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isFormValid = false

    var body: some View {
        ZStack {
            Color("bg3").ignoresSafeArea()

            VStack(spacing: 8.0) {
                Spacer()
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("ButtonColor"))
                    .multilineTextAlignment(.center)
                    .padding(.top, 240)

                FieldWithHeading(heading: "First Name:", placeholder: "Enter your first name", text: $firstName)
                FieldWithHeading(heading: "Last Name:", placeholder: "Enter your last name", text: $lastName)
                FieldWithHeading(heading: "Phone Number:", placeholder: "Enter your phone number", text: $phoneNumber, keyboardType: .numberPad)
                FieldWithHeading(heading: "Primary Location:", placeholder: "Enter your primary location", text: $primaryLocation)
                FieldWithHeading(heading: "Email:", placeholder: "Enter your email", text: $email, keyboardType: .emailAddress)
                FieldWithHeading(heading: "Password:", placeholder: "Enter your password", text: $password, isSecure: true)
                FieldWithHeading(heading: "Confirm Password:", placeholder: "Confirm your password", text: $confirmPassword, isSecure: true)

                Spacer()
                Button(action: signUp) {
                    Text("Sign Up")
                        .foregroundColor(Color("bg2"))
                        .padding()
                        .background(Color("ButtonColor"))
                        .cornerRadius(25)
                }
                Spacer()

                if isFormValid {
                    Text("Fill in all the fields")
                        .foregroundColor(.red)
                        .font(.subheadline)
                }
            }
            .padding(.top, -200)
            .frame(width: 350.0)
            .frame(height: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color("bg2"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("ButtonColor"), lineWidth: 3)
                    )
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Sign Up"), message: Text(alertMessage), dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    func signUp() {
        if firstName.isEmpty || lastName.isEmpty || !isValidPhoneNumber(phoneNumber) || !isValidEmail(email) || password.isEmpty || confirmPassword.isEmpty {
            alertMessage = "Fill in all the fields and check the formats of phone number and email."
            showingAlert = true
            isFormValid = true
        } else if password == confirmPassword {
            alertMessage = "Registration successful!"
            showingAlert = true
            isFormValid = false
        } else {
            alertMessage = "Passwords do not match. Please try again."
            showingAlert = true
            isFormValid = false
        }
    }
    func isValidPhoneNumber(_ phone: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone)
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

struct FieldWithHeading: View {
    var heading: String
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(heading)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color("ButtonColor"))
                .font(.caption)
                .lineLimit(nil)
                .padding(.top, 10.0)
            if isSecure {
                SecureField(placeholder, text: $text)
                    .frame(width: 280, height: 10)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("ButtonColor"), lineWidth: 1)
                    )
            } else {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
                    .frame(width: 280, height: 10)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color("ButtonColor"), lineWidth: 1)
                    )
            }
        }
    }
}


#Preview {
    Signup()
}
