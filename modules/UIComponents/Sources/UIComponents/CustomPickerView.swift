//
//  CustomPickerView.swift
//  
//
//  Created by Konstantin Zaharev on 19.12.2021.
//

import SwiftUI

public struct CustomPickerView: View {
    
    @Binding var categories: [String]
    @Binding var selected: String
    @Namespace private var ns
    
    var handler: () -> ()

    public init(categories: Binding<[String]>, selected: Binding<String>, handler: @escaping () -> () ) {
        self._categories = categories
        self._selected = selected
        self.handler = handler
    }

    public var body: some View {
        VStack {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                ScrollViewReader { scrollView in
                    
                    HStack {
                        
                        ForEach(categories, id: \.self) { item in
                            if item == selected {
                                ZStack() {
                                    Text(item)
                                        .bold()
                                        .layoutPriority(1)
                                    VStack() {
                                        Rectangle().frame(height: 2)
                                            .padding(.top, 20)
                                    }
                                    .matchedGeometryEffect(id: "animation", in: ns)
                                }
                            } else {
                                Text(item)
                                    .onTapGesture {
                                        withAnimation {
                                            selected = item
                                            scrollView.scrollTo(item)
                                            handler()
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 20)
                }
            }
        }
        .padding()
    }
    
}

struct CustomPickerView_Previews: PreviewProvider {
    @State static var categories: [String] = ["all", "business", "technology", "science", "sports"]
    @State static var selected: String = "all"
    static var previews: some View {
        CustomPickerView(categories: $categories, selected: $selected) {
            print("On change")
        }
    }
}
