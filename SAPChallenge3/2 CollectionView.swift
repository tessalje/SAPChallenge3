import SwiftUI

struct CollectionView: View {
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.34))
                        .frame(width: 280, height: 65)
                    
                    Text("Collection")
                        .font(.system(size: 45, weight: .bold))
                        .foregroundColor(.cyan)
                        .padding(.top, 2)
                }
                Spacer()
                FishTankView()
                    .frame(width: 400, height: 500)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue.opacity(0.8))
                        .frame(width: 250, height: 60)
                    
                    Text("Today's Tank")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 50)
            }
        }
    }
}

struct FishTankView: View {
    let tankWidth: CGFloat = 350
    let tankHeight: CGFloat = 500
    
    @State var gradientOffset: CGFloat = 0.0
    
    @State var bubbles: [BubbleData] = (0..<13).map { _ in
        BubbleData(
            size: CGFloat.random(in: 8...30),
            startX: CGFloat.random(in: -140...140), // up
            duration: Double.random(in: 4.0...8.0), // float spd
            delay: Double.random(in: 0...6.7)
        )
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.3), Color.cyan.opacity(0.5), Color.blue.opacity(0.3)],
                        startPoint: UnitPoint(x: 0, y: 0.5 + gradientOffset),
                        endPoint: UnitPoint(x: 1, y: 0.5 - gradientOffset)
                    )
                )
                .frame(width: tankWidth, height: tankHeight)
                .onAppear {
                    withAnimation(
                        .easeInOut(duration: 4.0)
                        .repeatForever(autoreverses: true)
                    ) {
                        gradientOffset = 0.2
                    }
                }
            
            //  Tank Border
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black.opacity(1), lineWidth: 20)
                .frame(width: tankWidth, height: tankHeight)
                .shadow(color: .blue.opacity(1), radius: 15, x: 0, y: 10)
                .clipped() // clipping mask htingy
            
            // bubbles
            ZStack {
                ForEach(bubbles) { bubble in
                    BubbleView(data: bubble, tankHeight: tankHeight)
                }
            }
            .frame(width: tankWidth, height: tankHeight)
            
            FishGrid()
        }
        .padding(.bottom, 30)
    }
}


#Preview {
    CollectionView()
}

