// Dependencies
import SwiftUI

struct CustomContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    var colors: [Color] = [.red, .blue, .pink, .purple, .orange, .green]
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        ScrollView(.init()) {
            TabView {
                ForEach(colors.indices, id: \.self) { index in
                    if index == 0 {
                        colors[index]
                            .overlay(
                                GeometryReader { proxy -> Color in
                                    let minX = proxy.frame(in: .global).minX

                                    //print(minX)

                                    DispatchQueue.main.async {
                                        withAnimation(.default) {
                                            self.offset = minX
                                        }
                                    }

                                    print(self.offset)

                                    return Color.clear
                                }
                                    .frame(
                                        width: 0,
                                        height: 0
                                    ),
                                alignment: .leading
                            )
                    } else {
                        colors[index]
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                // Animated Indicators...
                HStack(spacing: 15) {
                    ForEach(colors.indices, id: \.self) { index in
                        Capsule()
                            .fill(Color.white)
                            .frame(width: getIndex() == index ? 20 : 7, height: 7)
                    }
                }
                    .padding(
                        .bottom
                        ,UIApplication.shared.windows.first?.safeAreaInsets.bottom
                    )
                    .padding(.bottom, 100),
                alignment: .bottom
            )
        }
        .ignoresSafeArea()
    }
    
    func getIndex() -> Int {
        return Int(round(Double(offset / getWidth())))
    }
}

extension View {
    func getWidth() -> CGFloat {
        let index = UIScreen.main.bounds.width
        return index
    }
}

struct CustomContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomContentView()
    }
}
