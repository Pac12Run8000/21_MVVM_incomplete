//
//  ObserveableObject.swift
//  MVVMAPICallAcronyms
//
//  Created by Norbert Grover on 11/4/22.
//


import Foundation

final class ObserveableObject<T> {
    var value:T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener:((T) -> ())?
    
    init(_ value:T) {
        self.value = value
    }
    
    func bind(_ listener:@escaping(T) -> ()) {
        listener(value)
        self.listener = listener
    }
}

