//
//  SearchBar.swift
//  netflixclone
//
//  Created by ed on 16/05/2021.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = true
    
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.graySearchBackground
                .frame(width: 290, height: 38)
                .cornerRadius(8)
                
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.graySearchText)
                    .padding(.leading, 10)
                    
                
                TextField("Search", text: $text)
                    .foregroundColor(.white)
                    .accentColor(.graySearchText)
                    .cornerRadius(8)
                    .padding(8)
                    .padding(.leading, -8)
                    .background(Color.graySearchBackground)
                    .cornerRadius(8)
                    .frame(height: 34)
                    .onTapGesture(perform: {
                        isEditing = true
                    })
                    .animation(.default)
                    
                
                if !text.isEmpty {
                    if isLoading {
                        Button(action: {
                            text = ""
                        }, label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure {
                                    $0.color = .white
                                }
                        })
                        .frame(width: 35, height: 34)
                        .padding(.trailing, 5)
                    } else {
                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.graySearchText)
                                .frame(width: 35, height: 34)
                        })
                        .padding(.trailing, 5)
                    }
                }
                
                
                if isEditing {
                    Button(action: {
                        // clear the text, hide buttons, give up forst responder
                        text = ""
                        isEditing = false
                        hideKeyboard()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                    })
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            SearchBar(text: .constant("movie name"), isLoading: .constant(false))
                .padding()
        }
    }
}
