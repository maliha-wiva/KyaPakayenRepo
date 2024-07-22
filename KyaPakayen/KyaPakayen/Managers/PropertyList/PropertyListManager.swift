//
//  PropertyListManager.swift
//  KyaPakayen
//
//  Created by Maliha on 22.07.2024.
//

import Foundation
protocol PropertyListManagerProtocol {
    static func loadArray(from plistName: String) -> [String]
    static func loadDictionary(from plistName: String) -> [String: String]
    
}

struct PropertyListManager : PropertyListManagerProtocol
{
    static func loadDictionary(from plistName: String) -> [String: String] {
        guard let url = Bundle.main.url(forResource: plistName, withExtension: "plist"),
              let data = try? Data(contentsOf: url) else {
            return [:]
        }

        let dict: [String:String]
        do {
            dict = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String: String] ?? [:]
        } catch {
            print("Error reading plist: \(error.localizedDescription)")
            return [:]
        }
        
        return dict
    }
    
    static func loadArray(from plistName: String) -> [String] 
    {
            guard let url = Bundle.main.url(forResource: plistName, withExtension: "plist"),
                  let data = try? Data(contentsOf: url) else {
                return []
            }

            let array: [String]
            do {
                array = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String] ?? []
            } catch {
                print("Error reading plist: \(error.localizedDescription)")
                return []
            }
            
            return array
    }
    
    private func loadPlistData(of name: String) -> Data?{
        
        guard let path = getPlistPath(of: name) else { return nil}
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        return data
    }
    
    private func getPlistPath(of name: String) -> String? {
        
        guard let path = Bundle.main.path(forResource: name, ofType: "plist") else {
            return nil
        }
        return path
        
    }
}
