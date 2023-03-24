// Dependencies
import SwiftUI

struct CustomContentView: View {
    var body: some View {
        TabView {
            Text("Página 1")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Color.blue)
            Text("Página 2")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Color.green)
            Text("Página 3")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(Color.orange)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(CustomPageIndexViewStyle(circleColor: .red))
    }
}

struct CustomPageIndexViewStyle: PageIndexViewStyle {
    let circleColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 10) {
            ForEach(0..<configuration.pages.count) { index in
                Circle()
                    .foregroundColor(configuration.currentPageIndex == index ? circleColor : .gray)
                    .frame(width: 8, height: 8)
                    .scaleEffect(configuration.currentPageIndex == index ? 1.4 : 1.0)
                    .animation(.spring())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
