import SwiftUI


struct IconViewStroked: View{
  var systemName: String
  var onTap: (() -> Void)?;
  var body: some View{
    Image(systemName:systemName)
      .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(Color("TextColor"))
      .frame(width: 56.0, height: 56.0)
      .onTapGesture{
        onTap?()
      }
  }
  
}


struct IconViewFilled: View{
  var systemName: String
  var body: some View{
      Image(systemName:systemName)
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .foregroundColor(Color("ButtonFilledTextColor"))
        .frame(width: 56.0, height: 56.0)
        .background(Circle()
          .fill(Color("ButtonFilledBgColor"))
          )
    }
  
}

#Preview{
  VStack(spacing:30){
    IconViewStroked(systemName: "arrow.counterclockwise")
    IconViewFilled(systemName: "list.dash")
   
  }
}
