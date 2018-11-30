//
//  Almofire+Promise.swift
//
//  Created by Ravi on 30/11/18.
//

import Foundation

class AlmofirePromise {
  
  func fetchDictionary() -> Promise<Model> {
    let url = // https://
    return Promise { resolver in
      Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseData()
        .done({ jsonData, response -> Void in
          guard let model = try? JSONDecoder().decode(Model.self, from: jsonData) else {
            resolver.reject(NSError.errorWithDescription("Invalid JSON"))
            return
          }
          resolver.fulfill(model)
        }).catch { error in
          resolver.reject(error)
      }
    }
  }
  
  func fetchArray() -> Promise<[ModelArray]> {
    let url = // https://
    return Promise { resolver in
      Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseData().done { responseData, response -> Void in
        guard let jsonDic = (try? JSONSerialization.jsonObject(with: responseData, options: [])) as? [String: Any] else {
          resolver.reject(NSError.errorWithDescription("Invalid JSON"))
          return
        }
        
        do {
          let jsonData = try JSONSerialization.data(withJSONObject: jsonDic["json_key"] as Any, options: .prettyPrinted)
          guard let dataArray = try? JSONDecoder().decode([ModelArray].self, from: jsonData) else {
            resolver.reject(NSError.errorWithDescription("Invalid JSON"))
            return
          }
          resolver.fulfill(dataArray)
        } catch let error {
          resolver.reject(error)
        }
        }.catch { error in
          resolver.reject(error)
      }
    }
  }
}
