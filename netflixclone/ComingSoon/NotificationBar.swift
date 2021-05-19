//
//  NotificationBar.swift
//  netflixclone
//
//  Created by ed on 18/05/2021.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList: Bool
    
    var body: some View {
        Button(action: {
            // sho notification list
        }, label: {
            HStack {
                Image(systemName: "bell")
                Text("Notifications")
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18, weight: .bold))
        })
        .foregroundColor(.white)
        .padding()
    }
}

struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            NotificationBar(showNotificationList: .constant(false))
        }
        
    }
}
