//: Playground - noun: a place where people can play

import UIKit

var str = "Hello"
var newString=str + " Soo-Rae"

for character in newString
{println(character)}
var newTypeString = NSString(string:newString)
newTypeString.substringToIndex(4)
newTypeString.substringFromIndex(3)
newTypeString.substringWithRange(NSRange(location:3, length:5))
newTypeString.containsString("ello")
newTypeString.componentsSeparatedByString(" ")
newTypeString.uppercaseString
newTypeString.lowercaseString
