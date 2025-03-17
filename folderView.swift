//
//  FolderRowEx.swift
//  Printer App
//
//  Created by Moksh on 17/03/25.
//

import SwiftUI
import SwiftyUIX // <-- this is my own pod that have lots of useful extensions for quick development in swiftui

struct FolderData : Identifiable {
    var id = UUID()
    var colorCode: String
    var Name: String
}

struct FolderRowEx: View {
    var folders: [FolderData] = [
        .init(colorCode: "#FF0000", Name: "Sun flowers"),      // Red
        .init(colorCode: "#FF7F00", Name: "Tulips"),           // Orange
        .init(colorCode: "#FFFF00", Name: "Daisies"),          // Yellow
        .init(colorCode: "#008000", Name: "Lilies"),           // Green
        .init(colorCode: "#0000FF", Name: "Violets"),          // Blue
        .init(colorCode: "#800080", Name: "Lavender"),         // Purple
        .init(colorCode: "#FFC0CB", Name: "Roses"),            // Pink
        .init(colorCode: "#00FF00", Name: "Iris"),             // Light Green
        .init(colorCode: "#FF6347", Name: "Camellia"),         // Tomato Red
        .init(colorCode: "#FF4500", Name: "Cherry Blossoms"),  // Orange Red
        .init(colorCode: "#98FB98", Name: "Orchids"),          // Pale Green
        .init(colorCode: "#FFFACD", Name: "Magnolia"),         // Lemon Chiffon
        .init(colorCode: "#E0FFFF", Name: "Peonies"),          // Light Cyan
        .init(colorCode: "#ADD8E6", Name: "Forget-Me-Nots"),   // Light Blue
        .init(colorCode: "#D8BFD8", Name: "Lilac"),            // Thistle
        .init(colorCode: "#FFFFE0", Name: "Buttercups"),        // Light Yellow
        .init(colorCode: "#F0E68C", Name: "Jasmine"),          // Khaki
        .init(colorCode: "#FFD700", Name: "Goldenrod"),        // Gold
        .init(colorCode: "#C71585", Name: "Wisteria"),         // Medium Violet Red
        .init(colorCode: "#AFEEEE", Name: "Bluebell"),         // Pale Turquoise
        .init(colorCode: "#DDA0DD", Name: "Heather"),          // Plum
        .init(colorCode: "#FF1493", Name: "Poppies"),          // Deep Pink
        .init(colorCode: "#90EE90", Name: "Crocus"),           // Light Green
        .init(colorCode: "#87CEEB", Name: "Morning Glories"),  // Sky Blue
        .init(colorCode: "#F08080", Name: "Zinnias"),          // Light Coral
        .init(colorCode: "#FF4500", Name: "Peach Blossoms"),   // Orange Red
        .init(colorCode: "#32CD32", Name: "Cucumber Flowers"), // Lime Green
        .init(colorCode: "#FF6347", Name: "Marigolds"),        // Tomato
        .init(colorCode: "#E6E6FA", Name: "Snowdrops"),        // Lavender
        .init(colorCode: "#D2691E", Name: "Sunflowers"),       // Chocolate
        .init(colorCode: "#8A2BE2", Name: "Violets"),          // Blue Violet
        .init(colorCode: "#5F9EA0", Name: "Asters"),           // Cadet Blue
        .init(colorCode: "#7FFF00", Name: "Coriander"),        // Chartreuse
        .init(colorCode: "#FFB6C1", Name: "Peach Blossoms"),   // Light Pink
        .init(colorCode: "#6A5ACD", Name: "Bluebell"),         // Slate Blue
        .init(colorCode: "#A52A2A", Name: "Poppies"),          // Brown
        .init(colorCode: "#B22222", Name: "Cherry Blossoms"),  // Firebrick
        .init(colorCode: "#C0C0C0", Name: "Lavender"),         // Silver
        .init(colorCode: "#696969", Name: "Marigolds"),        // Dim Gray
        .init(colorCode: "#800000", Name: "Magnolia"),         // Maroon
        .init(colorCode: "#FF8C00", Name: "Daisies"),          // Dark Orange
        .init(colorCode: "#483D8B", Name: "Zinnias"),          // Dark Slate Blue
        .init(colorCode: "#2F4F4F", Name: "Iris"),             // Dark Slate Gray
        .init(colorCode: "#808000", Name: "Tulips"),           // Olive
        .init(colorCode: "#4169E1", Name: "Peonies"),          // Royal Blue
        .init(colorCode: "#FF0000", Name: "Roses")             // Red
    ]


    
    
    var body: some View {
        ZStack{
            ScrollView(.vertical) {
                //You can use Lazy here also but to save time i use normal stack
                VStack(spacing: -80) {
                    ForEach(folders.indices, id: \.self) { index in
                        folderView(folder: folders[index])
//                            .zIndex(Double(folders.count - index))
                    }
                }
                .padding(.horizontal,100)
            }
            
        }
        .fullFrame()
        .background(.ultraThinMaterial)
    }
}

#Preview {
    FolderRowEx()
}


struct folderView : View {
    var folder: FolderData
    @State var isHover : Bool = false
    
    var body: some View {
        
        HStack(alignment: .bottom){
            Image("folder")
                .resizable().aspectRatio(customContentMode: .fit)
                .squareFrame(size: 100)
                .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 0)
                
                .rotation3DEffect(.degrees(isHover ? 0 :45), axis: (x: 1, y: 0, z: 0),perspective: 0.1)
    //            .opacity(isHover ?  1 : 0.6)
                
            VStack(alignment: .leading){
                Text(folder.Name)
                    .font(.system(size: 20, weight: .bold))
                    .fullWidth(alignment: .leading)
                   
                    
                Text("198 MB")
                    .font(.system(size: 15, weight: .regular, design: .monospaced))
                    .opacity(self.isHover ? 1 : 0)
            }
            .opacity(self.isHover ? 1 : 0.05)
            .padding(.leading,20)
            .padding(.bottom,10)
          
        }
        .offset(x: isHover ? 150 : 0)
        .fullWidth(alignment: .leading)
        .zIndex(self.isHover ? 1000 : 0)
        .onHover { isHover in
            withAnimation(.bouncy) {
                self.isHover = isHover
            }
        }
       
    }
}
