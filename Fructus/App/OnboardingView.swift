// Dependencies
import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                TabView {
                    ForEach(fruits[0...8]) { item in
                        FruitCardView(fruit: item)
                    } //: LOOP
                } //: TAB
            }
            .tabViewStyle(PageTabViewStyle())
        }
        .edgesIgnoringSafeArea(.all)
        //.padding(.vertical, 0)
    }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
