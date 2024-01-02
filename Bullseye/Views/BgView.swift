import SwiftUI


struct BgView: View{
  @Binding var game: Game
  var body: some View{
    VStack{
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding().background(RingsView())
  }
}


struct TopView: View{
  @Binding var game: Game
  var body: some View{
    HStack(){
      IconViewStroked(systemName: "arrow.counterclockwise", onTap: {game.restart()})
      Spacer()
      IconViewFilled(systemName: "list.dash")
    }
  }
}


struct BottomView: View{
  @Binding var game: Game
  var body: some View{
    HStack{
      NumberView(number: String(game.score), numberType: "Score")
      Spacer()
      NumberView(number: String(game.round),numberType: "Round")
    }.padding()
  }
}


struct NumberView: View {
  var number: String
  var numberType: String
  var body: some View{
    VStack(spacing:5){
      labelTextView(text: numberType)
        Text(number)
          .bold()
          .font(.title3)
          .frame(width: 68, height: 56)
          .kerning(-0.2)
          .foregroundColor(Color("TextColor"))
          .overlay(
        RoundedRectangle(cornerRadius:21)
          .stroke(lineWidth: 2.0)
          .foregroundColor(Color("ButtonStrokeColor"))
      )
    }
    
  }
}


struct labelTextView: View{
  var text: String
  var body: some View{
    Text(text.uppercased())
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(1.5)
      .font(.caption)
  }
}


struct RingsView : View{
  @Environment(\.colorScheme) var colorScheme
  var body: some View{
    ZStack{
      Color("BackgroundColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      ForEach(1..<6){ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == .dark ? 0.1:0.3;
        Circle()
          .stroke(lineWidth: 20)
          .fill(
            RadialGradient(
              gradient: Gradient(colors: [Color("RingsColor").opacity(opacity * 0.8), Color("RingsColor").opacity(0)]) ,center: .center, startRadius: 100, endRadius: 300
          )
          )
        .frame(width: size, height: size)
      }
      
    }
  }
}
#Preview{
  BgView(game: .constant(Game()))
}
