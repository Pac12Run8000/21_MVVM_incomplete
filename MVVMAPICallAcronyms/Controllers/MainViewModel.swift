//
//  MainViewModel.swift
//  MVVMAPICallAcronyms
//
//  Created by Norbert Grover on 11/4/22.
//

import Foundation

class MainViewModel {
    var list:ObserveableObject<[String]> = ObserveableObject([String]())
    
    init() {}
    
    func populateTableView(input:String?) {
        guard let input = input else {return}
        fetchAPIData(key: .sf, value: input) { result in
            switch result {
            case .failure(let error):
                print("error: \(error)")
            case .success(let data):
                self.fetchListOfStringsFromData(data: data) { res in
                    switch res {
                    case .failure(let parseErr):
                        print("ParseError")
                    case .success(let succeed):
                        print("succeed:\(succeed)")
                    }
                }
            }
        }
        
    }
    
    
    func fetchListOfStringsFromData(data:Data, completion:@escaping(Result<Bool?, ParseError>) -> ()) {
        var funcList = [String]()
        let parser = JsonParser<AcronymObject>()
        parser.parseData(data: data) { result in
            switch result {
            case .failure(let err):
                completion(.failure(err))
            case .success(let output):
                for item in output[0].lfs {
                    funcList.append(item.lf)
                }
                self.list.value = funcList
                print("funcList:\(funcList)")
                completion(.success(true))
            }
        }
    }
    
    func fetchAPIData(key:URLQueryName, value:String, completion:@escaping(Result<Data, ResponseError>) -> ()) {
        guard let url = URLComponentConstants.createURLWithComponents(queryParameters: [key.rawValue:value])?.url else {
            completion(.failure(.invalidUrl))
            return
        }
        
        NetworkingService.shared.fetchAPIResponse(url: url) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data))
            }
        }
        
    }
}
