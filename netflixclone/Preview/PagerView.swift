//
//  PagerView.swift
//  netflixclone
//
//  Created by ed on 19/05/2021.
//

import SwiftUI

struct PagerView<Content: View>: View {
    
    let pageCount: Int
    
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    
    @State private var verticalDragIsActive = false
    
    let externaDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    
    let content: Content
    
    init(pageCount: Int,
         currentIndex: Binding<Int>,
         translation: Binding<CGFloat>,
         externaDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>,
         @ViewBuilder content: ()-> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.externaDragGesture = externaDragGesture
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                self.content.frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -(CGFloat(self.currentIndex) * geo.size.width))
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                externaDragGesture
                    .simultaneously(
                        with:
                            DragGesture(minimumDistance: 20)
                            .onChanged({ value in
                                if verticalDragIsActive {
                                    return
                                }
                                
                                if abs(value.translation.width) < abs(value.translation.height) {
                                    if abs(value.translation.width) < 30 {
                                        verticalDragIsActive = true
                                        return
                                    }
                                }
                                
                                // horiontal drag only
                                
                                translation = value.translation.width
                            })
                            .onEnded({ value in
                                if verticalDragIsActive {
                                    verticalDragIsActive = false
                                    return
                                }
                                
                                // ending a horizontal drag
                                let offset = value.translation.width / geo.size.width
                                let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                                
                                currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                                translation = 0
                            })
                    )
            )
        }
    }
}

//struct PagerDummy: View {
//    @State private var currentIndex: Int = 0
//    @State private var translation: CGFloat = .zero
//    var body: some View {
//        PagerView(pageCount: 4, currentIndex: $currentIndex, translation: $translation, externaDragGesture: externalDragGesture) {
//            Color.orange
//            Color.blue
//            Color.pink
//            Color.purple
//        }
//    }
//}
//
//struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PagerDummy()
//    }
//}
