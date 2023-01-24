//
//  buttons.swift
//  Calculator
//
//  Created by Sahil on 22/01/23.
//

import SwiftUI

struct buttons: View {
    var value : String = "1"
    var align : Alignment = .center
    var color: Color=Color(hue: 1.0, saturation: 0.0, brightness: 0.283)
    var width: CGFloat = 90
    var lead : CGFloat = 10
    var action: (buttons) -> Void = {_ in }
    var mode : CalculatorModes = .notset
    var body: some View {
        Button {
            action(self)
        } label: {
            Text(value)
                .padding(EdgeInsets(top:10, leading: lead, bottom: 10, trailing: 10))
        }
        .frame(width: width,height: 90,alignment:align)
        .foregroundColor(.white)
        .background(color)
        .font(.largeTitle)
        .clipShape(RoundedRectangle(cornerRadius: 50) )
    }
    
}

struct buttons_Previews: PreviewProvider {
    static var previews: some View {        ZStack {
        Color(.black)
        buttons(color: .gray)
        }
    .ignoresSafeArea()
    }
        
}
