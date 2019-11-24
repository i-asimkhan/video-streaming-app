///**
/**
munawlaApp
Created by: dev shanghai on 18/05/2019

(** Validation.swift **)
Shoukat Ullah
Copyright © 2019 Shoukat Ullah. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import Foundation
import UIKit

class Validation {
    
    func isValidEmail(_ emailString: String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailTest.evaluate(with: emailString)
    }
    
    func isValidZipCode(_ zipcodeString: String) -> Bool {
        
        let zipcodeRegex = "[0-9]{5}"
        
        let zipcodeTest = NSPredicate(format: "SELF MATCHES %@", zipcodeRegex)
        
        return zipcodeTest.evaluate(with: zipcodeString)
    }
    
    func isValidNumber(_ numberString: String) -> Bool {
        
        let numberRegex = "[0-9]{10,50}"
        
        let numberTest = NSPredicate(format: "SELF MATCHES %@", numberRegex)
        
        return numberTest.evaluate(with: numberString)
    }
    
    func isValidPhoneNumber(_ phoneString: String) -> Bool {
        
        let phoneRegex = "[0-9]{10}"
        
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        
        return phonePredicate.evaluate(with: phoneString)
    }
    
    func isValidCharacters(_ string: String) -> Bool {
        
        let regex = "[A-Za-z ]{1,}"
        
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return test.evaluate(with: string)
        
    }
    
    func isValidNickName(_ string: String) -> Bool {
        
        let regex = "[a-z|A-Z|_|.]+"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        
        return predicate.evaluate(with: string)
    }
    
    func validate(_ string: String, equalTo match: String) -> Bool {
        
        if (string == match) {
            
            return true
            
        }else {
            
            return false
            
        }
    }
}
