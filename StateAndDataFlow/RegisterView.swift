import SwiftUI

struct RegisterView: View {
    @State private var name = AppStorageManager.shared.userName
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, -65)
                Text("\(name.count)")
                    .padding()
                    .foregroundColor(name.count < 3 ? .red : .green)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(name.count < 3 ? true : false)
        }
    }
    private func registerUser() {
        if !name.isEmpty {
            userManager.name = name
            userManager.isRegistered.toggle()
            AppStorageManager.shared.userName = name
            AppStorageManager.shared.isRegistered = userManager.isRegistered
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
