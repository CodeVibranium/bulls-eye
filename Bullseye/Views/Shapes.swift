//
//  Shapes.swift
//  Bullseye
//
//  Created by Shahed on 24/12/23.
//

import SwiftUI

struct Shapes: View {
  var body: some View {
    VStack(spacing:20){
      Circle()
//        .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
//        .stroke(
        .inset(by:10)
        .stroke(Color.blue, lineWidth: 2)
        .frame(width: 200, height:100)
      Capsule()
        .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
        .stroke(Color.blue, lineWidth: 2).frame(width: 200, height:100)
      RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/ )
        .fill(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
        .stroke(Color.blue, lineWidth: 2)
        .frame(width: 200, height:100)
    }
    .padding(50)
    .background(Color.green)
  }
}

#Preview {
  Shapes()
}
