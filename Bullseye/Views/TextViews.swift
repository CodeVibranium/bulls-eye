import SwiftUI

struct InstructionText: View {
  var text: String
  var body: some View {
    Text(text)
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4)
      .font(.footnote)
      .kerning(2)
      .foregroundColor(Color("TextColor"))
  }
}


struct BigNumberText: View {
  var text: String;
  var body: some View{
    Text(String(text))
      .kerning(-1)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"));
  }
}


struct BodyText: View{
  var text: String
  var body: some View{
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12)
  }
}

struct ButtonText: View{
  var text: String
  var body: some View {
    VStack (alignment: .trailing){
      Text(text)
        .bold()
        .padding()
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity)
        .background(Color.accentColor)
        .cornerRadius(12)
       
      
    }
      
  }
}

// ctrl + cmd + space
#Preview {
  VStack{
    InstructionText(text:"Some Placeholder text")
    BigNumberText(text: "Some Target Value")
    BodyText(text: "🎉🎉🎉🎉, You scored 200 Points")
    ButtonText(text: "Hello")
  }.padding()
}

