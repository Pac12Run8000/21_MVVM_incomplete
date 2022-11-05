//
//  JsonParser.swift
//  MVVMAPICallAcronyms
//
//  Created by Norbert Grover on 11/4/22.
//

import Foundation



import Foundation


struct JsonParser<T:Decodable> {
    
    public func parseData(data:Data, completion:@escaping(Result<T, ParseError>) -> ()) {
        var output:T?
        do {
            output = try JSONDecoder().decode(T.self, from: data)
            completion(.success(output!))
        } catch {
            completion(.failure(.modelNotMatchingData))
        }
    }
    

    
}

