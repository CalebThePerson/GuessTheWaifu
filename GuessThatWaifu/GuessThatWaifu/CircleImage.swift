//
//  CircleImage.swift
//  GuessThatWaifu
//
//  Created by Caleb Wheeler on 1/8/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image(self.Waifus[number])
            .renderingMode(.original)
            .frame(width: 88, height: 88)
        .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth : 4))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
