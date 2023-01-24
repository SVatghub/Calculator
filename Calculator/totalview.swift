//
//  totalview.swift
//  Calculator
//
//  Created by Sahil on 22/01/23.
//

import SwiftUI

struct totalview: View {
    var viewfinder : String = "0"
    var body: some View {
        Text(viewfinder)
            .frame(maxWidth: .infinity,alignment: .trailing)
            .font(.system(size: 60))
            .fontWeight(.light)
            .foregroundColor(.white)
            .padding()
            .lineLimit(1)
    }
}

struct totalview_Previews: PreviewProvider {
    static var previews: some View {
        totalview()
            .background(.black)
    }
}
