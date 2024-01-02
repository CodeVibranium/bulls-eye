import SwiftUI


struct ResultView: View {
  @Binding var game: Game
  @Binding var isAlertVisible: Bool
  var sliderValue: Int
  
  var body: some View {
    VStack(spacing:14)
    {
      InstructionText(text: String("you have dropped on").uppercased())
      BigNumberText(text:String(sliderValue))
      BodyText(text: "You scored \(game.points(sliderValue: sliderValue)) points \n 🎉🎉🎉")
      Button(action:{
        
        let points = game.points(sliderValue: (sliderValue))
        game.startNewRound(points: points)
        isAlertVisible = false;
      }){
        ButtonText(text: "Start New Round")
      }
    }.padding()
      .frame(maxWidth: 300)
      .background(Color("BackgroundColor"))
      .cornerRadius(21)
      .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:5, y:5)
  }
}


#Preview {
  ResultView(game: .constant(Game()),
             isAlertVisible: Binding.constant(false),
             sliderValue: 10 )
}
