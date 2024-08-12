//
//  MealTypeSelectionView.swift
//  KyaPakayen
//
//  Created by Maliha on 23.07.2024.
//

import SwiftUI
import Foundation

func createTiles(x: CGFloat, y: CGFloat, color: Color, width: CGFloat, height: CGFloat) -> some View {
    Rectangle()
        .fill(color)
        .cornerRadius(15)
        .frame(width: width, height: height)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white, lineWidth: 1)
        )
        .position(x: x, y: y)
        .shadow(color: Color.black, radius: 5, x: 5, y: 5)
        .rotation3DEffect(Angle(degrees: 0), axis: (x: 1, y: 1, z: 1))
}

func ReadPList(MealTypes:String) -> [String: Any]  {
    guard let plistPath = Bundle.main.path(forResource: MealTypes, ofType: "plist") else {
        print("Plist file not found")
        exit(1)
    }

    // Read the plist file
    guard let plistData = try? Data(contentsOf: URL(fileURLWithPath: plistPath)) else {
        print("Error reading plist file")
        exit(1)
    }
    
    // Convert the plist data to a dictionary
    guard let plistDict = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String:Any] else {
        print("Error parsing plist file")
        exit(1)
    }
    
    return plistDict
    }



struct MealTypeList: View {
    var mealTypes : [String:String]
    
    init(){
        let plistDict = ReadPList(MealTypes: "MealTypes")
        mealTypes = plistDict.reduce([String: String]()) { result, entry in
            var result = result
            if let value = entry.value as? String {
                result[entry.key] = value
            }
            return result
        }
        for (key, value) in mealTypes {
            print("\(key): \(value)")
        }
    }
    
    var body: some View {
        ZStack{
            createTiles(x: 200, y: 270, color: Color.green, width: 280, height: 100)
            createTiles(x: 70, y: 390, color: Color.red, width: 100, height: 300)
            createTiles(x: 190, y: 520, color: Color.yellow, width: 270, height: 100)
            createTiles(x: 320, y: 330, color: Color.blue, width: 100, height: 300)
            createTiles(x: 240, y: 460, color: Color.black, width: 100, height: 100)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 120)), GridItem(.adaptive(minimum: 120))]) {
                ForEach(Array(mealTypes.keys), id: \.self) { key in
                    VStack {
                        Image(systemName: mealTypes[key] ?? "No value found")
                            .font(.title)
                        Text(key)
                    }
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.brown, lineWidth: 3)
                    )
                    .shadow(color: Color.black, radius: 5, x: 5, y: 5)
                    .rotation3DEffect(Angle(degrees: 0), axis: (x: 1, y: 1, z: 1))
                }
            }.padding()
        }.background(Color.brown.opacity(0.4)).ignoresSafeArea(.container)
    }
    
}


    


