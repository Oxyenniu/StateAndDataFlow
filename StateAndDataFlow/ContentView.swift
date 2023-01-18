import SwiftUI

struct ContentView: View {
    private var storageManager = AppStorageManager()
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(timer: timer)
                .padding(.top, -50)
            Spacer()
            
            LogOutButtonView(action: logOut)
                .padding(.bottom, 50)
        }
        
    }
    private func logOut() {
        userManager.isRegistered = false
        userManager.name = ""
        storageManager.isRegistered = false
        storageManager.userName = ""
    }
    
    struct ButtonView: View {
        @ObservedObject var timer: TimeCounter
        
        var body: some View {
            
            Button(action: timer.startTimer) {
                Text(timer.buttonTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 60)
            .background(.red)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 4)
            )
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(UserManager())
        }
    }
}
