import SwiftUI

struct ContentView: View {
  @State private var isAlertVisible: Bool = false;
  @State private var sliderVal: Double = 50;
  @State private var game: Game = Game()
  
  var body: some View {
    ZStack {
      BgView(game:$game)
    
      VStack {
        InstructionsView(game: $game).padding(.bottom, isAlertVisible ? -100 : 100)
        HitMe(
          isAlertVisible: $isAlertVisible,
          game: $game,
          sliderVal: $sliderVal
        )
      }
      if !isAlertVisible {
        SliderView(sliderVal: $sliderVal)
      }
    }
  }
}

//list.dash


struct SliderView: View{
  @Binding var sliderVal: Double;
  var body: some View{
    HStack{
      SliderLabelText(text:"1");
      Slider(value: $sliderVal, in: 1.0...100.0);
      SliderLabelText(text:"100");
    }.padding()
  }
}


struct SliderLabelText: View{
  var text: String;
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
//      .frame(width:35)
  }
}

struct InstructionsView : View{
  @Binding var game: Game
  var body: some View {
    VStack{
      InstructionText(text:"🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE \n AS YOU CAN TO").padding(.leading,30).padding(.trailing,30);
      BigNumberText(text:String("\(game.target)"))
    }
  }
}



struct HitMe: View{
  @Binding var isAlertVisible: Bool;
  @Binding var game: Game;
  @Binding var sliderVal: Double
  var body: some View {
    
    if isAlertVisible
    {
      ResultView(game: $game, isAlertVisible: $isAlertVisible, sliderValue: Int(sliderVal))
    }
    else{
      Button (
        action:{
          isAlertVisible = true;
        }
      )
      {
        Text("Hit me".uppercased()).bold().font(.title3)
      }
      .padding(20)
      .overlay(RoundedRectangle(cornerRadius: 21).stroke(Color.white, lineWidth: 6))
      .background(
        ZStack{
          Color("ButtonColor")
          LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
      .foregroundColor(Color.white)
      .cornerRadius(21)
    }
    
    
//    .alert(
//      "Hurray!!",
//      isPresented: $isAlertVisible ,
//      actions: {
//        Button("Awesome"){
//          let points = game.points(sliderValue: Int(sliderVal))
//          game.startNewRound(points: points)
//        }
//      },
//      message: {
//        Text("""
//          You dropped on \(Int(sliderVal))
//          You scored \(game.points(sliderValue: Int(sliderVal))) points in this round
//      """)
//        .foregroundColor(Color("TextColor"))
//      }
//    )
  }
}


#Preview {
  ContentView()
}
