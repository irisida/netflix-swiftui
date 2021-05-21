//
//  SmallVerticalButton.swift
//  netflixclone
//
//  Created by ed on 09/05/2021.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text: String
    var isOnImage: String
    var isOffImage: String
    var color: Color = Color.white
    var isOn: Bool
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack {
                Image(systemName:  isOn ? isOnImage : isOffImage)
                    .foregroundColor(color)
                
                Text(text)
                    .foregroundColor(color)
                    .font(.system(size: 14))
                    .bold()
                    
            }
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                print("Tapped")
            }
        }
    }
}
